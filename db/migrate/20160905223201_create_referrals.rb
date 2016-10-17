class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      #phase one
      t.boolean :pending, default: true
      t.boolean :phone_eval, default: false
      t.boolean :unqualified , default: false
      #phase two
      t.boolean :hr_eval, default: false
      t.boolean :no_position , default: false
      t.boolean :unqualified , default: false
      #phase Three
      t.boolean :interview , default: false
      #hired
      t.boolean :hired_hourly, default: false
      t.boolean :hired_salaried, default: false
      t.boolean :hired_hard_to_fill, default: false
      t.boolean :not_selected_eligible, default: false
      t.boolean :not_selected_ineligible, default: false

      t.text :phone_screening, default: {
        contacted1: false,
        contacted2: false,
        contacted3: false,
        unqualified: false,
        sent_to_hr: false
      }.to_json

      t.references :employee, foreign_key: true
      t.references :job_posting, foreign_key: true
      t.timestamps
    end
  end
end
