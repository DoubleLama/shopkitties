class OrderMailer < ApplicationMailer
  default from: ENV['EMAIL']


def confirmation_email(user)
  @url = "localhost:3000/sign_in"
  @user = user
  @cart_id = @user.cart_id
  @order_array = []

  @order_id = Order.where(user_id: @user.id).last.id

  mail(to: @user.email, subject: 'Votre commande Shopkitties')
  end

end
