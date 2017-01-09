class PokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:id])
    @pokemons = @trainer.pokemons
    # before action for these 2 settings?
    # add release pokemon option
  end

  def show
    #if else statement for incorrect routes
    @trainer = Trainer.find(params[:id])
    @pokemon = @trainer.pokemons[params[:pokemon_id].to_i-1]
  end
end
