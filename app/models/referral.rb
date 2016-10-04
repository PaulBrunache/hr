class Referral < ApplicationRecord
  belongs_to :employee
  has_many :jobPostings_referrals
  has_many :job_posting, through: :jobPostings_referrals
  serialize :phone_screening ,JSON
  serialize :hr_screening ,JSON
  serialize :interviewing ,JSON
end


# rails g migration CreateJoinTablejobPostingReferral jobPosting referral
