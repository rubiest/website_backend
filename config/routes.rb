Rails.application.routes.draw do
  namespace :admin, path: '/admin' do
    get "/" => "dashboards#index", as: 'admin'
    resources :categories, except: [:edit, :update]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  root 'pages#index'

  devise_scope :user do
    get '/login' => 'users/sessions#new'
    get '/register' => 'users/registrations#new'
    get '/settings' => 'users/registrations#edit'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
