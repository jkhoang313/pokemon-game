class Pokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokedex
  #add uniqueness to trainer name
end
