class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.boolean :pending, default: true
      t.boolean :phone_screening, default: false
      t.boolean :hr_screening, default: false
      t.boolean :interviewing , default: false
      t.boolean :hired , default: false
      t.boolean :unqualified , default: false

      t.text :phone_screening, default: {
        contacted1: false,
        contacted2: false,
        contacted3: false,
        unqualified: false,
        sent_to_hr: false
      }.to_json

      t.text :hr_screening, default: {
        not_qualified: false,
        qualified: false,
        moved_to_interview: false
      }.to_json

      t.text :interviewing, default: {
        hired_hourly: false,
        hired_salaried: false,
        hired_hard_to_fill: false,
        not_selected_eligible: false,
        not_selected_ineligible: false
      }.to_json

      t.references :employee, foreign_key: true
      t.references :job_posting, foreign_key: true
      t.timestamps
    end
  end
end
