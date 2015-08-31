Rails.application.routes.draw do
  devise_for :users

  get 'static_pages/contact'
  get 'static_pages/about'
  get 'dashboard/overview'
  get 'dashboard/drafted_posts'
  get 'dashboard/scheduled_posts'

  resources :posts do
    resources :comments, module: :posts, only: [:create]
  end

  resources :users, only: [:index, :show], shallow: true do
  end

  root 'posts#index'
end
