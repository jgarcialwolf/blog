Rails.application.routes.draw do
  root 'welcome#index'
  # get 'users', to: 'users#index'
  # get "/users/:id", to: "users#show"
  
  resources :users
  resources :articles do
    resources :comments
  end
  # get 'articles', to: 'articles#index'
  # get "/articles/:id", to: "articles#show"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
