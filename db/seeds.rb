# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create!(
	item_name:'さくら',
	shipdate:"1995/10/10",
	price:'1000',
	stock:'1000',
	status:'true',
	item_profile_id:'box3',
	genre_id: 1,
	label_id: 1,
	artist_id: 1,
	)
