module ReferralsHelper
  def get_referral_status(referral)
    status = {
      pending: referral.pending,
      phone_screening: referral.phone_screening,
      hr_screening: referral.hr_screening,
      interviewing: referral.interviewing,
      hired: referral.hired,
      unqualified: referral.unqualified
    }
    status.each do |key, value|
      if value
        return key
      end
    end
  end
end
