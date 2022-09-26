Rails.application.routes.draw do
  resources :students, only: %i[index show create update destroy]
  resources :instructors, only: %i[index show create update destroy]
end
