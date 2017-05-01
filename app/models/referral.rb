class Referral < ApplicationRecord
  belongs_to :employee
  belongs_to :job_posting
  serialize :phone_screening ,JSON

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /\d{3}\d{3}\d{4}/, message: "Invalid format" }
  validates :job_posting, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :scope => :job_posting,
                          message: " was already submitted for this Job"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: "Please Enter a valid email please"

  def self.to_csv(options = {})
    attributes = %w{Name Email Telephone_Number Processed_Date}

    CSV.generate(options) do |csv|
      csv << attributes
      all.each do |referral|
        csv << attributes.map{ |attr| referral.send(attr) }
      end
    end
  end

  def Name
    "#{first_name} #{last_name}"
  end
  def Email
    "#{email}"
  end
  def Telephone_Number
    "#{phone_number}"
  end
  def Processed_Date
    "#{updated_at}"
  end
end
