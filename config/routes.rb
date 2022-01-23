Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'user/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :score
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      resources :questions, except: %i[index], shallow: true do
        resources :answers, except: %i[index], shallow: true
      end
    end
  end
end
