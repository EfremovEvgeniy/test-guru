Rails.application.routes.draw do
  resources :tests, only: [] do # временная опция, пока нет котроллера
    resources :questions, only: %i[index show new create destroy]
  end
end
