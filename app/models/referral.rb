class Referral < ApplicationRecord
  belongs_to :employee
  has_many :job_postings
  serialize :phone_screening ,JSON


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
