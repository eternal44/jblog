Rails.application.routes.draw do
  devise_for :users

  get 'contact' => 'static_pages#contact'
  get 'dashboard/overview'

  resources :posts do
    resources :comments, module: :posts, only: [:create]
  end

  resources :users, only: [:index, :show], shallow: true do
  end

  root 'posts#index'
end
