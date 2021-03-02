Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'posts#index'

  resources :posts

  scope '/users/:user_id' do
    resource :profile
  end

  resources 'user_posts', path: 'my_posts', as: 'my_posts'
end
