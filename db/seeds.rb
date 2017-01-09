# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# loads pokedex
puts "Loading Pokedex..."
id = 1
while id <= 151
  @pokedex = JSON.parse(RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}/"))

  pokedex_params = {"name"=> @pokedex["name"]}
  @pokedex["stats"].each do |stat_hash|
    stat_name = stat_hash["stat"]["name"].gsub("-", "_")
    stat_value = stat_hash["base_stat"]
    pokedex_params[stat_name] = stat_value
  end
  Pokedex.create(pokedex_params)

  puts "So many Pokemon to load..." if id == 75
  id += 1
end

# loads Jackson's profile
puts "Creating Trainer Jackson..."
@jackson = Trainer.create(name: "Jackson", password: "lily", age: 24, starter_pokemon: "charmander", gender: "Male", last_token: Time.now.to_i)
@jackson_starter = Pokedex.find_by(name: "charmander")
@jackson.pokemons << @jackson_starter.create_pokemon(@jackson)
@jackson_second_pokemon = Pokedex.find_by(name: "dratini")
@jackson.pokemons << @jackson_second_pokemon.create_pokemon(@jackson)

# loads Lily's profile
puts "Creating Trainer Lily..."
@lily = Trainer.create(name: "Lily", password: "jackson", age: 24, starter_pokemon: "squirtle", gender: "Female", last_token: Time.now.to_i)
@lily_starter = Pokedex.find_by(name: "squirtle")
@lily.pokemons << @lily_starter.create_pokemon(@lily)
@lily_second_pokemon = Pokedex.find_by(name: "pikachu")
@lily.pokemons << @lily_second_pokemon.create_pokemon(@lily)
