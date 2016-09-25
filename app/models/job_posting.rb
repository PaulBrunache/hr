class JobPosting < ApplicationRecord
  has_many :jobPostings_referrals
  has_many :referrals, through: :jobPostings_referrals

end
