# Encoding: UTF-8
Login.create :firstname => "Tibor", :lastname => "Jászi", :email => "tibor.jaszi@gmail.com", :encrypted_password => "87e9b3abaf20eb3866f55689fdc5df2b124d5f84", :created_at => Time.now, :updated_at => Time.now, :salt => "dd4c2fddda2faa89572b1db7e190cafd9cc77a0c"
Login.create :firstname => "Viktória", :lastname => "Jászi", :email => "jasziviki@gmail.com", :encrypted_password => "1bcde419f47437aa732e6418291b243e37a1dfba", :created_at => Time.now, :updated_at => Time.now, :salt => "eebb7ed410fe4f346f480db22f63975727cbc789"
Product.create :add_name => "Tej", :add_price => "300", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 1
Product.create :add_name => "Coca Cola", :add_price => "250", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 2
Product.create :add_name => "Bögre", :add_price => "800", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 1
Product.create :add_name => "Virág", :add_price => "2500", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 2
Product.create :add_name => "Egér", :add_price => "12000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 1
Product.create :add_name => "Asztal", :add_price => "30000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 2
Product.create :add_name => "Szék", :add_price => "10000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 1
Product.create :add_name => "TV", :add_price => "80000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 2
Product.create :add_name => "Ágy", :add_price => "180000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 1
Product.create :add_name => "Laptop", :add_price => "300000", :add_pic => "/img/box.jpg", :created_at => Time.now, :updated_at => Time.now, :login_id => 2