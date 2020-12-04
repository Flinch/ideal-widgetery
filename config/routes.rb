Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about' 
  get 'results', to: 'anime_widgets#results'	
  resources :anime_widgets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
