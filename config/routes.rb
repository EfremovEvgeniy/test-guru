Rails.application.routes.draw do
  root 'tests#index'

  resources :sessions, only: :create
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: :create

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
