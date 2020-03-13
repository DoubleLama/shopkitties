class UserMailer < ApplicationMailer
  default from: ENV['EMAIL']

  def welcome_email(user)

  @user = user

  @url = 'https://thawing-cliffs-40883.herokuapp.com/sign_in'

  mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

end
