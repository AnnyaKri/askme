Rails.application.routes.draw do
  root to: "questions#index"
  resources :questions do
    member do
      put :hide
    end
  end

  resource :session, only: %i[new create destroy]
  resources :users, except: :index, param: :nickname
  resources :hashtags, only: :show, param: :body
end
