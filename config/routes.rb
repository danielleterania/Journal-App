Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :tasks
    collection do
      get 'today'
    end
  end

  root 'categories#index'
end
