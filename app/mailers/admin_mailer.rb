class AdminMailer < ApplicationMailer
  default from: 'yglass@nfnetwork.org'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_users.subject
  #
  def new_users(user)
    @user = user    
    mail(to: "orsusbass@gmail.com", subject: "NFStrong - New User Summary")
  end
end
