Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about' 
  get 'query', to: 'anime_widgets#start'
  get 'search', to: 'anime_widgets#search'
  resources :anime_widgets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
