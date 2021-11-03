Rails.application.routes.draw do

  root to: "homes#top"
  get"about" => "homes#about", as:"about"

  devise_for :users
  post "follow/:id" => "relationships#follow", as: "follow"
  post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
  resources :users, only: [:show, :edit, :update, :index]

  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit, :update,] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search' => 'post_images#search'
    end
  end



end
