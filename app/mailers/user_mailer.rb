class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_mail(user)
    @user = user
    @url = 'http://www.example.com/login'
    mail(to: @user.email, subject: 'Welcome to my site')
  end

  def create_document_mail(user, personal_document)
    @user = user
    @personal_document = personal_document
    mail(to: @user.email, subject: 'Documento añadido a Docus')
  end
end
