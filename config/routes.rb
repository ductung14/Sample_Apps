Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/home", to: "static_pages#home"
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    get "/microposts", to: "static_pages#home"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :account_activations, only: [:edit]
    resources :microposts, only: [:create, :destroy]
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
