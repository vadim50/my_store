Rails.application.routes.draw do
  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
