class CreateJobPostings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_postings do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
