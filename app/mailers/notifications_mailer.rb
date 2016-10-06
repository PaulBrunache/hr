class NotificationsMailer < ApplicationMailer
  def submission_confirmation(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Thank you! Your referral has been accepted.",
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
