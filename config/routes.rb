Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[show]
  post :swipe_right, to: "decisions#swipe_right"
  post :swipe_left, to: "decisions#swipe_left"
  get :matches, to: "pages#matches"

end

# post :favorites, to: "favorites#create_favorite"
# <%= link_to favorites_path(phrase_country: favorite_phrase), data: {turbo_method: :post}, notice: "The phrase was added in your favorites" do %>
