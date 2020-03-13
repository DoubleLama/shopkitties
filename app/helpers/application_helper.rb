module ApplicationHelper
  def confirmation_email(user)

    @user = user
  
    @cart_id = @user.cart
  
    @order_array = []
    @order_items = OrderItem.all.each do |item|
        @order_array << item
    end
  
    mail(to: @user.email, subject: 'Votre commande Shopkitties')
  
    end
end
