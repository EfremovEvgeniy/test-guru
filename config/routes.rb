Rails.application.routes.draw do
  resources :tests, only: [] do # временная опция, пока нет котроллера
    resources :questions, shallow: true
  end
end
