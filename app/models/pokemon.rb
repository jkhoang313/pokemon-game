class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokedex
  #change pokemon to auto capitalize
end
