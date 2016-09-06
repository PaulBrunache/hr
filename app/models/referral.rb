class Referral < ApplicationRecord
  belongs_to :employee
  belongs_to :position
  serialize :status,JSON
  serialize :phone_screening ,JSON
  serialize :hr_screening ,JSON
  serialize :interviewing ,JSON
end
