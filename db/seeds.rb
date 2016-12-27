# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# load all pokemon
puts "Loading Pokedex..."
id = 1
while id <= 151
  @pokemon = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}/"))
  Pokemon.create(name: @pokemon["name"])
  puts "So many Pokemon to load..." if id == 75
  id += 1
end

# loads Jackson's profile
puts "Creating Trainer Jackson..."
@jackson = Trainer.create(name: "Jackson", age: 24, starter_pokemon: "charmander", gender: "Male")
@jackson.pokemons << Pokemon.find_by(name: "charmander")
