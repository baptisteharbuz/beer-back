Faker::UniqueGenerator.clear

15.times do
  country = Country.create(name: Faker::Nation.unique.capital_city)
  
  bar = Bar.create(name: Faker::Company.unique.name)
  
  beer = Beer.create(
    brand: Faker::Beer.unique.brand, 
    style: Faker::Beer.style, 
    quantity: rand(10..100), 
    country: country
  )
  
  if Beer.any?
    bar.beers << Beer.all.sample(rand(1..5))
  end
end