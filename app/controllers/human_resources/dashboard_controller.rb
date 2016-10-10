class HumanResources::DashboardController < ApplicationController
  before_action :authenticate_human_resource!
  before_action :validate_role, only: [:manageAdmins, :create_hr]

  def manageReferrals
    @referral_list = Referral.where(pending: true)
    @referral_for_hr = Referral.where(sent_to_hr: true)
    @referral_count = @referral_list.size
  end

  def manageAdmins
    @admin = HumanResource.new
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

  def profile
  end

  #Phases
  def phase_one
    job = JobPosting.where(id: @referral.job_posting_id).first
    referral = Referral.where(id: params[:referral_id]).first
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
    puts "\n\nThese are the Params: \n #{params.to_json}\n\n"

  end

  def phase_three
    puts "\n\nThese are the Params: \n #{params.to_json}\n\n"

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
end
