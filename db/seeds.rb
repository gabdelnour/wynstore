ItemSize.destroy_all
Item.destroy_all
User.destroy_all
Review.destroy_all
Size.destroy_all

sizes = ["XS", "S", "M", "L", "XL"]

sizes.each { |s| Size.create(size_name: s) }

shirt1 = Item.create(
  item_name:" Wyncode Miami Vice",  
  item_description:"This design is a nod to the Miami Heat vice jerseys. Let's go Heat!", 
  price:24.99, 
  category:"Shirts", 
  design:"Miami Vice",
  item_ref: 'MV-Shirt-1',
  itemURL: "https://wynstore-assets.herokuapp.com/images/Artboard_3.png" 
)

Item.find(1).item_images.create(image_url: "https://wynstore-assets.herokuapp.com/images/Artboard_1.jpg", pose: "back")
Item.find(1).item_images.create(image_url: "https://wynstore-assets.herokuapp.com/images/Artboard_9.png", pose: "main")
Item.find(1).item_images.create(image_url: "https://wynstore-assets.herokuapp.com/images/Artboard_8.png", pose: "symbol")
Item.find(1).item_images.create(image_url: "https://wynstore-assets.herokuapp.com/images/Artboard_7.png", pose: "moto")

shirt2= Item.create(
  item_name:" Wyncode <Developer>",  
  item_description:"Show off your full-stack developer skills with this shirt.", 
  price:24.99, 
  category:"Shirts", 
  design:"Developer",
  item_ref: 'D-Shirt-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Artboard_10.png"
)

shirt3= Item.create(
  item_name:"Wyncode TA",  
  item_description:"Wear your heart, and \"TA\", on your sleeve.", 
  price:24.99, 
  category:"Shirts", 
  design:"TA1",
  item_ref: 'TA-Shirt-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Artboard_2.png"
)

shirt4= Item.create(
  item_name:"Wyncode <gotHired>",  
  item_description:"Growth mindset is an important part of being a Wyncoder. You WILL get that web dev job!", 
  price:24.99, 
  category:"Shirts", 
  design:"Hired",
  item_ref: 'Hired-Shirt-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Artboard_11.png"
)

shirt5= Item.create(
  item_name:"Classic Logo Shirt",  
  item_description:"Simple, but never basic.", 
  price:24.99, 
  category:"Shirts", 
  design:"Classic",
  item_ref: 'classic-shirt-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_4.png"
)

sweater1= Item.create(
  item_name:"Classic Logo Sweater",  
  item_description:"Stay warm while you show off your Wyncode pride.", 
  price:44.99, 
  category:"Sweaters", 
  design:"Classic",
  item_ref: 'classic-sweater-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_5.png"
)

sticker1= Item.create(
  item_name:"Sticker Pack",  
  item_description:"A pack of two Wyncode stickers. Put them on your laptop, or wherever else you like!", 
  price:2.99, 
  category:"Stickers", 
  design:"Palm and Art of Code",
  item_ref: 'sticker-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_6.png"
)

mug1= Item.create(
  item_name:"Ceramic Mug",  
  item_description:"Code all night with this mug by your side. Coffee not included.", 
  price:9.99, 
  category:"Mugs", 
  design:"Classic",
  item_ref: 'mug-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_1.png"
)

bottle1= Item.create(
  item_name:"Water Bottle",  
  item_description:"Hydration is key.", 
  price:14.99, 
  category:"Bottles", 
  design:"Classic",
  item_ref: 'mug-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_2.png"
)

bag1= Item.create(
  item_name:"Messenger Bag",  
  item_description:"Tired of carrying around your laptop? This bag can help!", 
  price:44.99, 
  category:"Accessories", 
  design:"Classic",
  item_ref: 'bag-1',
  itemURL:  "https://wynstore-assets.herokuapp.com/images/Bluebg_3.png"
)

Item.all.each do |item|
  if Item.category = !"Shirts" || !"Sweaters"
    Size.all.each { |size| ItemSize.create(item_id: item.id, size_id: "Add to cart")}
  else
  Size.all.each { |size| ItemSize.create(item_id: item.id, size_id: size.id) }
  end
 end

review1 = Review.create(
  rating: 5,
  comments: "Hey this is awesome!",
  user_id: 1,
  item_id: 1
)

puts "Database seeded with #{Item.count} items!"

User.create(email: 'some@guy.com', password: 'password', admin: false)
User.create(email: 'another@guy.com', password: 'password2', admin: false)
User.create(email: 'admin@email.com', password: 'password', admin: true)
