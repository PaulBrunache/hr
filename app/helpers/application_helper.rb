module ApplicationHelper
  def get_total_rows
    @rowSize = Referral.all.size+ JobPosting.all.size + Employee.all.size + Department.all.size + HumanResource.all.size
  end
  def reroute(controller)
    routes = ['human_resources/dashboard','employees/dashboard', 'referrals','job_postings']

    if routes.include?(controller) or current_page?(edit_human_resource_registration_path) or
      current_page?(edit_employee_registration_path)
      return true
    else
      false
    end
  end

  def is_hr_logged_in?(controller)
      if controller == 'human_resources/dashboard' or controller == 'job_postings' or
        current_page?(edit_human_resource_registration_path)
        true
      else
        false
      end
  end
  def get_job_name(id)
    job = JobPosting.where(id: id).first
    job.title
  end
  def get_referral_count(role)
    # if role == "Human Resources"
    #   referral = Referral.where("status@> = ?", {pending: true}.to_json)
    #   size = referral.size
    # else
      referral = Referral.all
      size = referral.size
      size
    # end
  end
  def list_has_data?(list)

    if list.nil? || list.size == 0
      false
    else
      true
    end
  end
end
