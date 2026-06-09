   # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]

    mail(
      to: @user.email,
      subject: "Cześć. Miło mi że zapisałeś się na tą stronę"
    )
  end
end