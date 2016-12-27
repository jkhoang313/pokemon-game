Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :pokemons

  get '/', to: 'games#index'
  get '/about', to: 'games#about'
end
