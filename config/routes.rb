Rails.application.routes.draw do

  root to: 'homes#top'
  get"about" => "top#about", as:"about"
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit] do
    resources :post_comments, only: [:create, :destroy]
  end

end
