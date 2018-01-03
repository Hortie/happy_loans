Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :loans, only: [:new, :create, :index, :destroy, :update] do

    member do
      patch :keep_to_true
    end
    resources :schedules, only: [:new, :create, :destroy, :update]


  end

end
