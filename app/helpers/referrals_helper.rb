module ReferralsHelper
  def get_referral_status(referral)
    status = {
      pending: referral.pending,
      phone_screening: referral.phone_eval,
      hr_screening: referral.hr_eval,
      interviewing: referral.interview,
      hired: false,
      not_hired: false
    }
    if referral.hired_hourly || referral.hired_salaried ||referral.hired_hard_to_fill
      status.hired = true
    end
    if referral.not_selected_eligible || referral.not_selected_ineligible || referral.no_position ||
      referral.unqualified
      status.not_hired = true
    end

    if status[:pending] and !status[:phone_screening]
      current_status = "Pending"
    elsif status[:phone_screening] and !status[:hr_screening]
      current_status = "Phone Screening"
    elsif status[:hr_screening] and !status[:interviewing]
      current_status = "HR Screening"
    elsif status[:interviewing] and !status[:hired]
      current_status = "Interviewing"
    elsif status[:hired]
      current_status = "Hired"
    else
      current_status = "Not Hired"
    end

    current_status
  end
end
