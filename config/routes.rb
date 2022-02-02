Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'user/sessions' }

  resources :gists, only: :create

  resources :badges, only: :index

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :score
    end
  end

  namespace :admin do
    resources :badges
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: %i[index], shallow: true do
        resources :answers, except: %i[index], shallow: true
      end
    end
  end
end
