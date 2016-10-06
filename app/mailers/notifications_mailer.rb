class NotificationsMailer < ApplicationMailer
  def submission_confirmation(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Thank you! Your referral has been accepted.",
    )
  end
  def submission_confirmation_for_referral(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @referral.email,
      subject: "Congrats! You Were Submitted to Our Employee Referral Program.",
    )
  end

  def two_contact_attempts(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - We Are in Need of Your Assistance.",
    )
  end

  def not_qualified(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!",
    )
  end
end
