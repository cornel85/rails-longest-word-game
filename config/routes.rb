Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new

  # get 'games/score'
  get 'score', to: 'games#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  post 'score', to: 'games#score'
end

