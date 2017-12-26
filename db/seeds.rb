puts "Destroying all seeds"
Beer.destroy_all
Cat.destroy_all
Color.destroy_all
Food.destroy_all
User.destroy_all


MULTIPLIER = 10

puts "Creating Beers, Cats, Colors, and Foods"
(MULTIPLIER * 1).times do
  Beer.create!(name: Faker::Beer.unique.style)
  Cat.create!(name: Faker::Cat.unique.name)
  Color.create!(name: Faker::Color.unique.color_name)
  Food.create!(name: Faker::Food.unique.dish)
end

puts "Creating users and profiles"
(MULTIPLIER * 2).times do
  user = User.create!(name: Faker::Internet.unique.user_name)
  user.profile = Profile.create!({
    user_id: user.id,
    beer_id: Beer.all.sample.id,
    cat_id: Cat.all.sample.id,
    color_id: Color.all.sample.id,
    food_id: Food.all.sample.id
    })
end

puts "Creating user love interests"
users = User.all.sample(MULTIPLIER)

users.each do |user|
  dating_pool = User.where('id != ?', user.id)
  interests = dating_pool.sample(MULTIPLIER/2)

  interests.each do |i|
    Interested.create!(interester_id: user.id, interestee_id: i.id)
  end

end

