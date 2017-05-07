Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'

  resources :jobs do
    resources :resumes
    collection do
      get :search
      get :category
    end
  end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end

  namespace :account do
    resources :jobs
  end

  get 'about', to: 'jobs#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
