module ReferralsHelper
  def get_referral_status(id, status)
    status.each do |key, value|
      if value
        return key
      end
    end
  end
end
