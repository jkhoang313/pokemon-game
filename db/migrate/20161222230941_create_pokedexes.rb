class CreatePokedexes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.integer :level, :default => 1
      t.string :hp
      t.string :attack
      t.string :defense
      t.string :special_attack
      t.string :special_defense
      t.string :speed

      t.timestamps
    end
  end
end
