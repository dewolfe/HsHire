class UserMailer < ActionMailer::Base
  default from: "message@homeschoolhire.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.profile_message.subject
  #
  def profile_message(profile,user,subject,message)
      @sender=user.email

      @message=message

    mail to: profile.user.email,subject:subject
  end
end
