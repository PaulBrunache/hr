class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number

      t.text :status, default: {
        pending: true,
        phone_screening: false,
        hr_screening: false,
        interviewing: false,
        hired: false,
        unqualified: false
      }.to_json

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
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
