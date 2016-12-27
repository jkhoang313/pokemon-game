class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :starter_pokemon

      t.timestamps
    end
  end
end
