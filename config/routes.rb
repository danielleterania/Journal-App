Rails.application.routes.draw do
  devise_for :users
  
  resources :categories do
    resources :tasks do
      collection do
        get 'today'
      end
    end
  end

  root 'categories#index'
end
