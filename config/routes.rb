Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainers
  resources :pokemons

  get '/', to: 'game#index'
  get '/about', to: 'game#about'
end
