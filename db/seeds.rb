# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(username: 'Abzed', password: 'Abzedar2', pic: 'https://res.cloudinary.com/abzed/image/upload/v1658123480/azagfvxpgtszyuqafdr0.jpg', email: 'abzed@user.com')

user2 = User.create(username: 'Dee', password: 'Abzedar2', pic: 'https://res.cloudinary.com/abzed/image/upload/v1658123480/azagfvxpgtszyuqafdr0.jpg', email: 'dee@user.com')

pet1 = Pet.create(name: "Snow White", description: "She shines like a damind", image: "https://www.thesprucepets.com/thmb/CDWS5MhW2zshJHA-YRmockBcCY8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Samoyed-d78c4bb2c56b4c2ab004dc421441fb10.jpg", likes: 150, user_id: user1.id)

pet2 = Pet.create(name: "Chappy", description: "best pet as a friend", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRllbyXqtHTwYKX0X-aaIfvEhF--00JC9mBi4AIlODk3Zlgbo3P97mi9J4wezlzDInQwNE&usqp=CAU", likes: 50, user_id: user2.id)

Comment.create(comment: "Good one", pet_id: pet1.id, user_id: user2.id)
Comment.create(comment: "looks shabby", pet_id: pet2.id, user_id: user1.id)
