Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users

  resources :users
  resources :photos do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: :follow
  post 'unfollow/:id' => 'relationships#unfollow', as: :unfollow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
