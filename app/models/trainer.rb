class Trainer < ApplicationRecord
  has_secure_password
  has_many :pokemons
  before_save :capitalize_name
  #add uniqueness to trainer name

  def capitalize_name
    self.name = self.name.downcase.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

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

  def token_time_passed?
    time_passed = last_token + 14400

    time_passed - Time.now.to_i > 0 ? false : true
  end

  def token_status
    if token_time_passed?
      "Available upon login"
    else
      total_seconds = last_token + 14400 - Time.now.to_i
      hours_left = total_seconds / 3600
      seconds_left = total_seconds % 3600

      minutes_left = seconds_left / 60
      final_seconds = seconds_left % 60
      "#{hours_left} Hour(s) #{minutes_left} Minute(s) #{final_seconds} Second(s)"
    end
  end

  def add_token
    @new_token = self.poke_tokens + 1
    self.update(poke_tokens: @new_token, last_token: Time.now.to_i)
  end

  def starters
    self.pokemons[0..5]
  end

  def storage
    self.pokemons[6..-1]
  end

  #make method for moving starters and storage pokemon
end
