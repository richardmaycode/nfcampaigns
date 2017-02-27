class PaymentsMailer < ApplicationMailer
  default from: 'orsusbass@gmail.com'
  
  def registration_payment(user, payment)
    @user = user
    @payment = payment
    mail(to: @user.email, subject: '#NFStrong Registration Payment Receipt')
  end
  
end