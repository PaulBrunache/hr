class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.references :employee, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
