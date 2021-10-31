Rails.application.routes.draw do

  root to: "homes#top"
  get"about" => "homes#about", as:"about"

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit, :update,] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search' => 'post_images#search'
    end
  end



end
