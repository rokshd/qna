Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answer
  end

  root to: "questions#index"
end
