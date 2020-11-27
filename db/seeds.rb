# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(name: 'Ting', password_digest: 'hello', email_address: 'tchung682@gmail.com')

user1.avatar.attach(
    io: File.open('./public/avatars/avatar1.jpg'),
    filename: 'avatar1.jpg',
    content_type: 'application/jpg'
)