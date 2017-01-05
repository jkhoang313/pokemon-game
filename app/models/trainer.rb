class Trainer < ApplicationRecord
  has_many :trainer_pokemons
  has_many :pokemons, through: :trainer_pokemons

  def self.random_starter
    common = ["caterpie", "weedle","pidgey", "rattata", "spearow", "zubat", "tentacool", "geodude", "magikarp"]
    rare = ["ekans", "sandshrew", "nidoran-f", "nidoran-m", "oddish", "paras", "venonat", "diglett", "meowth", "mankey", "abra", "machop", "bellsprout", "magnemite", "doduo", "grimer", "shellder", "voltorb", "koffing", "tangela", "horsea", "goldeen", "staryu"]
    super_rare = ["pikachu", "clefairy", "vulpix", "jigglypuff", "psyduck", "growlithe", "poliwag", "ponyta", "slowpoke", "farfetchd", "seel", "gastly", "onix", "drowsee", "krabby", "exeggcute", "cubone", "rhyhorn", "chansey", "tauros", "ditto", "eevee"]
    ultra_rare = ["pinsir", "lickitung", "hitmonlee", "hitmonchan", "kangaskhan", "lapras", "mr-mime", "scyther", "jinx", "electabuzz", "magmar", "porygon", "omanyte", "kabuto", "aerodactyl", "snorlax", "dratini"]

    random_number = rand(1..100)

    if random_number < 40
      common.sample
    elsif random_number < 70
      rare.sample
    elsif random_number < 90
      super_rare.sample
    else
      ultra_rare.sample
    end
  end
end
