Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post"/users" => "users#create"
    post"/sessions" => "sessions#create"

    # get"/tickets" => "tickets#index"
    # post"/tickets" => "tickets#create"
    # get"/tickets/:id" => "tickets#show"
    # patch"/tickets/:id" => "tickets#update"
    # delete"/tickets/:id" => "tickets#destroy"

    # get"/venues" => "venues#index"
    # post"/venues" => "venues#create"
    # get"/venues/:id" => "venues#show"
    # patch"/venues/:id" => "venues#update"
    # delete"/venues/:id" => "venues#destroy"

    # get"/orders" => "orders#index"
    # post"/orders" => "orders#create"
    # get"/orders/:id" => "orders#show"
    # patch"/orders/:id" => "orders#update"
    # delete"/orders/:id" => "orders#destroy"
  end
end
