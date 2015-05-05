20.times do
	user = User.create!(
		name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: '123456'
  )

  rand(10).times do
  	user.posts.create!(
      title: Faker::Company.catch_phrase,
      code: Faker::Lorem.paragraph(2), 
      annotations: Faker::Company.bs )
  end
end

