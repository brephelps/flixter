Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resource :dashboard, only: [:show]
  root 'static_pages#index'

  resources :users, only: :show
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]

  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update]
    resources :sections, only: [] do
      resources :lessons, only: [:create]
    end
    resources :courses do
      resources :sections, only: [:create]
    end
  end
end
