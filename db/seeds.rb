# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'aws-sdk-s3'
require 'faker'

yopmail_array = ["mabite@yopmail.com", "thptoulouse@yopmail.com", "monsieurx@yopmail.com", "salutmabite@yopmail.com", "jaimemabite@yopmail.com"]

image_array = ["https://cdn.pixabay.com/photo/2012/02/27/17/05/animal-17542_960_720.jpg","https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554_960_720.jpg", "https://cdn.pixabay.com/photo/2013/05/30/18/21/tabby-114782_960_720.jpg", "https://cdn.pixabay.com/photo/2014/03/29/09/17/cat-300572_960_720.jpg", "https://cdn.pixabay.com/photo/2015/04/23/21/59/tree-736877_960_720.jpg", "https://cdn.pixabay.com/photo/2015/03/27/13/16/cat-694730_960_720.jpg", "https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662_960_720.jpg", "https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404_960_720.jpg", "https://cdn.pixabay.com/photo/2015/08/30/10/58/cat-914110_960_720.jpg", "https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720_960_720.jpg", "https://cdn.pixabay.com/photo/2018/07/13/10/20/cat-3535404_960_720.jpg", "https://cdn.pixabay.com/photo/2015/10/12/15/01/cat-984097_960_720.jpg", "https://cdn.pixabay.com/photo/2016/11/29/01/10/adorable-1866475_960_720.jpg", "https://cdn.pixabay.com/photo/2018/05/30/19/29/cat-3442257_960_720.jpg", "https://cdn.pixabay.com/photo/2016/11/14/19/20/kittens-1824367_960_720.jpg", "https://cdn.pixabay.com/photo/2018/03/29/21/51/cute-3273789_960_720.jpg", "https://cdn.pixabay.com/photo/2019/10/18/09/29/cat-4558651_960_720.jpg", "https://cdn.pixabay.com/photo/2020/01/29/21/57/cat-4803841_960_720.jpg", "https://cdn.pixabay.com/photo/2019/10/23/18/58/malai-4572548_960_720.jpg", "https://cdn.pixabay.com/photo/2018/09/10/22/24/animal-3668199_960_720.jpg"]

# i = 1
# 4.times{
#   Cart.create()
#   User.create(cart_id: i, email: yopmail_array[i], password: Faker::Alphanumeric.alphanumeric(number: 10))
#   CartItem.create(cart_id: i, item_id: i)
#   Order.create(user_id: i, cart_id: User.find(i).cart_id)
#   i = i + 1
# }
#
# n = 1
# 20.times {
#   @item = Item.create(title: Faker::Beer.brand, description: Faker::Food.description, price: rand(1..10), image_url: image_array[n])
#   @item.cat_picture.attach(0)
#   n = n + 1
# }



s3 = Aws::S3::Resource.new(region: 'eu-west-3') # Change this to your region

Item.destroy_all
User.destroy_all

User.create!(email:"shopkitties@yopmail.com", password:"123456")

20.times do |i|
    item = Item.create!(
                    title: Faker::Games::Pokemon.name,
                    description: Faker::Food.description,
                    price: rand(1..100),
                    image_url: image_array[i])

    # Create the object to retrieve
    obj = s3.bucket('active-storage-kitties').object("#{i}.webp")    # change this to your bucket name

    # Get the item's content and save it to local
    obj.get(response_target: "app/assets/images/chatons/#{i}.webp")

    item.cat_picture.attach(io: File.open("app/assets/images/chatons/#{i}.webp"), filename: "#{i}.webp")

end
