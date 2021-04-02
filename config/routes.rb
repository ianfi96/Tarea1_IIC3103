Rails.application.routes.draw do
  root to: 'home#index'
  get "/season", to: "season#index"
  get "/episode", to: "episode#show"

  get "/character", to: "character#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
