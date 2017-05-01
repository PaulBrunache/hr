class EmployeeMailer < ApplicationMailer
  default from: 'no-reply@morselife.org'

  def submission_confirmation(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Thank you! Your referral has been accepted."
    )
  end

  def two_contact_attempts(employee,referral)
    @employee = employee
    @referral = referral
    mail(to: @employee.email,
      subject: "Referral Status Update - We Are in Need of Your Assistance."
    )
  end

  def final_attempt(employee,referral)
    @employee = employee
    @referral = referral
    mail( to: @employee.email,
      subject: "Referral Status Update - Thank you for Thinking of Us!"
    )
  end

  def not_qualified(employee,referral,job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail( to: @employee.email,
      subject: "Referral Status Update - Thank You!"
    )
  end

  def no_position_available(employee,referral,job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Referral Status Update - You are Ahead of the Game!"
    )
  end

  def interview(employee,referral, job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Referral Status Update - Great News!"
    )
  end

  def hired(employee,referral,job)
    @employee = employee
    @referral = referral
    @job = job.title
    mail(to: @employee.email,
      subject: "Referral Status Update - Congratulations!"
    )
  end

  def points(employee,points,prize)
    @employee = employee
    @referral = referral
    mail( to: @employee.email,
      subject: "You've Earned It!"
    )
  end
end
