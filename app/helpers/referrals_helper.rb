module ReferralsHelper
  def get_job_name(id)
    puts "\nthis is the ID: #{id}\n"
    job = JobPosting.where(id: id).first
    job.title
  end
  def get_referral_status(id, status)
    status.each do |key, value|
      if value
        return key
      end
    end
  end
end
