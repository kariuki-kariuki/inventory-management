# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# id
# user_id
# name
# category
# description
# quantity
asset1 = Asset.create(
   user_id:1 ,
   name: "HP Envy 15" ,
   category: "Laptop",
   description: "Intel core i7, 16GB RAM, 512GB SSD",
   quantity: "5"
)
asset2 = Asset.create(
   user_id:2 ,
   name: "DELL inspiron 15-3000"
   category: "Laptop",
   description: "core i5, 8GB RAM, 512GB SSD" ,
   quantity: "9"
)
asset3 = Asset.create(
   user_id: 2,
   name: "ASUS Vivo-Book 14" ,
   category: "Laptop",
   description: "core i5, 8GB RAM, 256GB SSD",
   quantity: "7"
)
asset4 = Asset.create(
   user_id:1 ,
   name: "MacBook Pro 14" ,
   category: "Laptop",
   description: "Apple M1-PRO, 64GB RAM, 1TB SSD",
   quantity: "2"
)
asset5 = Asset.create(
   user_id: 1,
   name: "Lenovo Yoga 720" ,
   category: "Laptop",
   description: "core i5, 16GB RAM, 512GB SSD",
   quantity: "8"
)
asset6 = Asset.create(
   user_id: 1,
   name: "HP Elite-Book 1030" ,
   category: "Laptop",
   description: "core i7, 8GB RAM, 512GB SSD",
   quantity: "9"
)
asset7 = Asset.create(
   user_id:2 ,
   name: "DELL Latitude 5400" ,
   category: "Laptop",
   description: "core i5, 8GB RAM, 256GB SSD",
   quantity: "10"
)
asset8 = Asset.create(
   user_id: 1,
   name: "ASUS X409" ,
   category: "Laptop",
   description: "core i7, 8GB RAM, 256GB SSD",
   quantity: "6"
)
asset9 = Asset.create(
   user_id: 1,
   name: "Macbook Pro A1708" ,
   category: "laptop",
   description: "core i5, 8GB RAM, 256GB SSD",
   quantity: "3"
)
asset10 = Asset.create(
   user_id: ,
   name: "Lenovo IdeaPad 3" ,
   category: "Laptop",
   description: "core i5, 8GB RAM, 512GB SSD",
   quantity: "4"
)
asset11 = Asset.create(
   user_id: ,
   name: "HP ProBook X360" ,
   category: "Laptop",
   description: "core i5, 16GB RAM, 512GB SSD",
   quantity: "12"
)
asset12 = Asset.create(
   user_id: ,
   name: "HP Lolio 1040" ,
   category: "Laptop",
   description: "core i7, 8GB RAM, 256GB SSD ",
   quantity: "9"
)
asset13 = Asset.create(
   user_id: ,
   name: "Lenovo X1 Carbon" ,
   category: "Laptop",
   description: "core i7, 8GB RAM, 256GB SSD",
   quantity: "16"
)
asset14 = Asset.create(
   user_id: ,
   name: "ASUS ZenBook UX481F" ,
   category: "Laptop",
   description: "Intel core i7, 16GB RAM, 1TB SSD",
   quantity: "12"
)
asset15 = Asset.create(
   user_id: ,
   name: "DELL XPS13" ,
   category: "",
   description: "Intel core i7, 16GB RAM, 256GB SSD",
   quantity: "13"
)
asset16 = Asset.create(
   user_id: ,
   name: "HP Spectre x360" ,
   category: "Laptop",
   description: "Intel core i7, 16GB RAM, 1TB SSD",
   quantity: ""
)
asset17 = Asset.create(
   
   user_id: ,
   name: "Lenovo Legion 7" ,
   category: "Laptop",
   description: "Intel core i7, 26GB, 1TB SSD ",
   quantity: "8"
)
asset18 = Asset.create(
  
   user_id: ,
   name: "HP Victus 16" ,
   category: "Laptop",
   description: "Intel core i5, 16GB RAM, 512GB SSD",
   quantity: "6"
)
asset19 = Asset.create(
   
   user_id: ,
   name: "ASUS X543U" ,
   category: "Laptop",
   description: "Intel core i3, 4GB RAM, 1TB SSD",
   quantity: "22"
)
asset20 = Asset.create(
   user_id: ,
   name: "ASUS 409F" ,
   category: "Laptop",
   description: "Intel core i7, 8GB RAM, 1TB SSD",
   quantity: "11"
)
request1 = Request.create(
   id: 1,
   user_id: ,
   asset_id: ,
   name: ,
   category ,
   quantity ,
   status ,
   urgency ,
)