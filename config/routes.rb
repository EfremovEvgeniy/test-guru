Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges, exept: %i[show edit update]
    resources :tests, exept: :index do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :gists, only: :index, path: '/admin/gists'

  resources :feedbacks, only: %i[new create]

  resources :badges, only: %i[index]
end
