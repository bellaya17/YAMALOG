Rails.application.routes.draw do

  root to: 'homes#top'
  get"about" => "top#about", as:"about"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

end
