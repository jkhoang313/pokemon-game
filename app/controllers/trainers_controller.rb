class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
  end

  def create
    @trainer = Trainer.create(post_params)
    @trainer.pokemons << Pokemon.find_by(name: params[:trainer][:starter_pokemon])

    redirect_to trainer_path(@trainer)
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy

    redirect_to trainers_path
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update(name: params[:trainer][:name], age: params[:trainer][:age], starter_pokemon: params[:trainer][:starter_pokemon])

    redirect_to trainer_path(@trainer)
  end

  private

  def post_params
    params.require(:trainer).permit(:name, :age, :gender, :starter_pokemon)
  end
end
