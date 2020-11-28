# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Entry.destroy_all
Comment.destroy_all
Like.destroy_all

user1 = User.create(name: 'Ting', password_digest: 'hello', bio: "I have been a Christian for several years. I am an aspiring software engineer looking to fulfill God's purpose for my life.", email_address: 'tchung682@gmail.com')

user1.avatar.attach(
    io: File.open('./public/avatars/avatar1.jpg'),
    filename: 'avatar1.jpg',
    content_type: 'application/jpg'
)

user2 = User.create(name: 'Lucy', password_digest: 'hello', bio: "Excited to create some entries!", email_address: 'lucy@example.com')

user3 = User.create(name: 'Emmet', password_digest: 'hello', bio: "Looking for a move of God!", email_address: "emmet@example.com")

entry1 = Entry.create(content: "Praying for peace for the coming year!", user_id: user1.id, public: true)

comment1 = Comment.create(content: "I agree! Hope to see peace!", user_id: user2.id, entry_id: entry1.id)

like1 = Like.create(liked: true, user_id: user2.id, entry_id: entry1.id)
like1 = Like.create(liked: true, user_id: user3.id, entry_id: entry1.id)