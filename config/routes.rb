Rails.application.routes.draw do
  root to: 'home#index'
  get "/season", to: "season#index"
  get "/episode", to: "episode#show"

  get "/character", to: "character#show"
  get "/character/search", to: "character#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
