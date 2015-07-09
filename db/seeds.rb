# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post_job = Product.create(title: "Post Job",
	subtitle: "Web Dev", author: "Said Maadan", price: "250.00", sku: "PJB01", description: %{<p>Front end developer</>
		<p>With eyears experience in web development</p>})