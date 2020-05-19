Rails.application.routes.draw do
  #    pages = controller; home = action
  root 'pages#home'
  get 'about', to: 'pages#about'
    resources :articles
    #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
