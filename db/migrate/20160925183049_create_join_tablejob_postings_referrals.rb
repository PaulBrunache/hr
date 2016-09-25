class CreateJoinTablejobPostingsReferrals < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobPostings, :referrals do |t|
      t.index [:job_posting_id, :referral_id]
    end
  end
end
