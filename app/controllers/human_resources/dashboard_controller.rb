class HumanResources::DashboardController < ApplicationController
  before_action :authenticate_human_resource!
  before_action :validate_role, only: [:manageAdmins, :create_hr]

  def manageReferrals
    @concierge_referral_list = Referral.where({unqualified: false, hr_eval: false})
    @hr_referral_list = Referral.where({hr_eval: true, interview: false})
  end

  def manageAdmins
    @admin = HumanResource.new
  end
  def interview
    @list = Referral.where({interview: true, hired_hourly: false,hired_hard_to_fill: false,
      not_selected_ineligible: false, not_selected_eligible: false, no_position: false})
  end
  def viewAdmins
    @hr_admin_list = HumanResource.all
  end

  def create_hr
    password = generate_password
    @admin = HumanResource.new(email: params[:admin_email],
    password: password, password_confirmation: password, role: params[:role])

    if @admin.valid?
      @admin.save!
      flash[:success] = "HR Admin was successfully created"
      render :manageAdmins
      @admin.send_reset_password_instructions
    else
      render :manageAdmins
    end
  end

  def leaderboard
    @employee_list = Employee.order(points: :asc)
  end

# Referral status List
  def list_for_hired
    @list = Referral.where({hired_hourly: true,hired_hard_to_fill: true})
    respond_to do |format|
      format.html
      format.csv { send_data @list.to_csv, filename: "hired-#{Date.today}.csv" }
      format.xlsx { send_data @list.to_csv(col_sep: "\t"), filename: "hired-#{Date.today}.xlsx"}
    end
  end

  def list_for_no_position
    @list = Referral.where(no_position: true)
    respond_to do |format|
      format.html
      format.csv { send_data @list.to_csv, filename: "no-position-#{Date.today}.csv" }
      format.xlsx { send_data @list.to_csv(col_sep: "\t"), filename: "no-position-#{Date.today}.xlsx"  }
    end
  end

  def list_for_not_selected
    @list = Referral.where({not_selected_ineligible: true, not_selected_eligible: true})
    respond_to do |format|
      format.html
      format.csv { send_data @list.to_csv, filename: "not-selected-#{Date.today}.csv"}
      format.xlsx { send_data @list.to_csv(col_sep: "\t"), filename: "not-selected-#{Date.today}.xlsx" }
    end
  end

  def list_for_unqualified
    @list = Referral.where(unqualified: true)
    respond_to do |format|
      format.html
      format.csv { send_data @list.to_csv, filename: "unqualified-#{Date.today}.csv"}
      format.xlsx { send_data @list.to_csv(col_sep: "\t"), filename: "unqualified-#{Date.today}.xlsx" }
    end
  end

  #Phases
  def phase_one
    referral = Referral.where(id: params[:referral_id]).first
    job = JobPosting.where(id: referral.job_posting_id).first
    employee = Employee.where(id: referral.employee_id).first

    if params[:contacted1].present?
      update_referral('phone_screening',referral, 'contacted1', params[:contacted1])
      referral.phone_eval = true
      referral.save
    end
    if params[:contacted2].present?
      update_referral('phone_screening',referral, 'contacted2', params[:contacted2])
      EmployeeMailer.two_contact_attempts(employee,referral).deliver
    end
    if params[:contacted3].present?
      update_referral('phone_screening',referral, 'contacted3', params[:contacted3])
      EmployeeMailer.final_attempt(employee,referral).deliver
      ReferralMailer.final_attempt(employee,referral).deliver
    end
    if params[:unqualified].present?
      update_referral('phone_screening',referral, 'unqualified', params[:unqualified])
      referral.unqualified = true
      referral.save
      EmployeeMailer.not_qualified(employee,referral,job).deliver
    end
    if params[:sent_to_hr].present?
      update_referral('phone_screening',referral, 'unqualified', params[:sent_to_hr])
      referral.hr_eval = true
      referral.save
    end
    flash[:success] = "Referral was successfully updated and notified"
    redirect_to hr_dashboard_manageReferrals_path
  end

  def phase_two
    if params[:phase_two].present?
      referral = Referral.where(id: params[:referral_id]).first
      job = JobPosting.where(id: referral.job_posting_id).first
      employee = Employee.where(id: referral.employee_id).first

      case params[:phase_two]

      when "no_position"
        referral.no_position = true
        referral.save
        EmployeeMailer.no_position_available(employee,referral,job).deliver
        ReferralMailer.no_position_available(employee,referral,job).deliver
      when "unqualified"
        referral.unqualified = true
        referral.save
        EmployeeMailer.not_qualified(employee,referral,job).deliver
      else
        add_points(employee,employee.points, 25 )
        referral.interview = true
        referral.save
        EmployeeMailer.interview(employee,referral,job).deliver      ReferralMailer.interview(employee,referral,job).deliver
      end
      flash[:success] = "Referral was successfully updated"
    else
      flash[:error] = "You must select an option"
      redirect_to hr_dashboard_manageReferrals_path
    end
  end

  def phase_three
    if params[:phase_three].present?
      referral = Referral.where(id: params[:referral_id]).first
      job = JobPosting.where(id: referral.job_posting_id).first
      employee = Employee.where(id: referral.employee_id).first

      case params[:phase_two]
      when "not_selected_ineligible"
        referral.not_selected_ineligible = true
        referral.save
      when "not_selected_eligible"
        referral.not_selected_eligible = true
        referral.save
      when "hired_hourly"
        add_points(employee,employee.points, 125)
        referral.hired_hourly = true
        referral.save
        EmployeeMailer.hired(employee,referral,job).deliver
      when "hired_salaried"
        add_points(employee,employee.points, 225 )
        referral.hired_salaried = true
        referral.save
        EmployeeMailer.hired(employee,referral,job).deliver
      when "hired_hard_to_fill"
        add_points(employee,employee.points, 50 )
        referral.hired_salaried = true
        referral.save
        EmployeeMailer.hired(employee,referral,job).deliver
      else
        referral.no_position = true
        referral.save
      end
      flash[:success] = "Referral was successfully updated"
      redirect_to hr_dashboard_interview_path
    else
      flash[:error] = "You must select an option"
      redirect_to hr_dashboard_interview_path
    end
  end

  #manage
  def destroyReferrals
    Rails.logger.debug params.inspect

    url = params[:path].sub("list_for_", "")
    puts "\n\n#{url}"
    url = "hr_dashboard_" + url + "_path"
    puts "\n\n#{url}"
    if params[:deleteThis]
      params[:deleteThis].each  do |key, val|
        if val.eql? "true"
          referral = Referral.where(email: key).first
          referral.destroy
        end
      end
      redirect_to send(url)
      flash[:success] = "Record/Records were successfully deleted"
    else
      flash[:warning] = "In order to delete a record you must use the slider"
    end
  end
  private
    def generate_password
      Devise.friendly_token.first(6)
    end
    def validate_role
      if current_human_resource.role == 'Human Resources'
        true
      else
        flash[:error] = "you are not authorized to access this section"
        redirect_to hr_dashboard_manageReferrals_path
        false
      end
    end
    def update_referral(phase, referral, field, value)
      case phase
      when 'phone_screening'
        referral.phone_screening[field] = value
      when 'hr_screening'
        referral.hr_screening[field] = value
      else
        referral.interviewing[field] = value
      end
      referral.save
    end
    def add_points(employee, current_points, amount)
      employee.points = current_points + amount
      employee.save
    end

end
