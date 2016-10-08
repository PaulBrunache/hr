class ReferralMailer < ApplicationMailer
  def submission_confirmation(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @referral.email,
      subject: "Congrats! You Were Submitted to Our Employee Referral Program.",
    )
  end
  def no_position_available(employee,referral,job)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!",
    )
  end
  def interview(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Congrats! You're Moving to the Next Step",
    )
  end
  def final_attempt_referral(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!",
    )
  end

end
