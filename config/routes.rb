Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  get '/dashboard', to: 'dashboard#index'

  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end

  resources :scores

  get '/admin', to: 'admin#index'
  scope :admin do
    resources :categories
  end

  resources :play, only: :show
end
