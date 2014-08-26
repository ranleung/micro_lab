# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Creating Users

dustin = User.create({email: "dustin@gmail.com", first_name: "Dustin", last_name: "Yu", image_url: "www.yahoo.com", password: "123"})
david = User.create({email: "david@hotmail.com", first_name: "David", last_name: "Javate", image_url: "www.google.com",password: "123"})
randall = User.create({email: "randall@yahoo.com", first_name: "Randall", last_name: "Leung", image_url: "www.facebook.com",password: "123"})


# Creating Pages
page1 = Page.create({name: "Dustin's About Me Page", content: "My name is Dustin.  And this is the cotent to the about me page!"})
page2 = Page.create({name: "Contact Dustin", content: "Do you want to contact Dustin?  This is Dustin's contact page!"})

# Creating Posts
post1 = Post.create({title: "Dustin's First Post", body: "THIS IS MY FIRST POST!"})
post2 = Post.create({title: "Second Post", body:"THIS IS THE BODY OF THE SECOND POST!"})

# Creating Comments
comment1 = Comment.create({content: "Pop-up Godard fashion axe Pinterest flannel, messenger bag seitan High Life."})
comment2 = Comment.create({content: "Direct trade seitan forage tousled try-hard, DIY paleo selvage distillery Kickstarter hoodie."})




# Test to see if User has many Pages
dustin.pages << page1
dustin.pages << page2

# Test to see if User has many Posts
dustin.posts << post1
dustin.posts << post2

# Test to see if Post has many Comments
post1.comments << comment1
post1.comments << comment2

# Test to see if Posts and Tags have many-to-many
post1.tags.create({name: "Awesome"})
post1.tags.create({name: "COOL"})
post2.tags.create({name: "WOW"})
post2.tags.create({name: "NICE"})





