Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#root'

  resources :articles#, only: %i[index create show new edit update destroy]

end
