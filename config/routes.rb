Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # before

get 'items/index'
# after
root 'items#index'

resources :items, only: [:index, :show, :new, :create] do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
end

resources :users, only: :show do
  member do
    get 'log_out'
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :transacts
resources :addresses
resources :cards
end
