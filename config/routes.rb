Rails.application.routes.draw do
  get 'users', to: 'users#index'
  root 'welcome#index'
  
  resources :articles do
    resources :comments
  end
  # get 'articles', to: 'articles#index'
  # get "/articles/:id", to: "articles#show"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
