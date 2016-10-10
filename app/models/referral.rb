class Referral < ApplicationRecord
  belongs_to :employee
  has_many :job_postings
  serialize :phone_screening ,JSON
  serialize :hr_screening ,JSON
  serialize :interviewing ,JSON
end
