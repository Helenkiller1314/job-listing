Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'

  resources :jobs do
    resources :resumes
    collection do
      get :search
      get :category
      # get :产品经理
      # get :游戏开发
      # get :新媒体运营
      # get :硬件开发
      # get :web开发
      # get :Android开发
      # get :云计算
      # get :测试工程师
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

  # namespace :account do
  #   resources :jobs
  # end

  get 'about', to: 'jobs#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
