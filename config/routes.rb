Rails.application.routes.draw do

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: %i[index], shallow: true do
      resources :answers, except: %i[index], shallow: true
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :score
    end
  end
end
