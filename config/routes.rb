Rails.application.routes.draw do
  root to: 'tops#index'
  post "likes/:beach_id/create" => "likes#create"
  post "likes/:beach_id/destroy" => "likes#destroy"
  resources :likes, only: [:show, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :beaches do
   collection do
      get :top5
   end
  end 
  resource :beaches, only: [:like] do
    collection do
      post :confirm
      get :like
    end
  end 
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
