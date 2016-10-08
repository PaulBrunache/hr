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
  def final_attempt(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!",
    )
  end
  def final_attempt_referral(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!",
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
      subject: "Referral Status Update - Thank you for Thinking of Us!",
    )
  end
  def hired(employee,referral,job)

  end
  def points(employee,points,prize)

  end
end
