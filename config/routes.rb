Rails.application.routes.draw do

  root to: 'home#index'
  get 'user', to: 'user#index'

  namespace :admin do
    root to: "home#index"
    resources :users
  end

  namespace :members do
    root to: "home#index"
  end
  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    invitations: 'users/invitations'
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  # devise_scope :user do
  # get 'login', to: 'devise/sessions#new'
  # end
  
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
