Rails.application.routes.draw do

  root 'static_pages#home'
  #get 'static_pages/home'
  # - Обратите внимание, что теперь предыдущий маршрут static_pages/home больше не будет работать
  # так как он определен корневым маршуртом при помощи root


  get '/help',    to: 'static_pages#help'    #get 'static_pages/help' было при создании контроллера
  get '/about',   to: 'static_pages#about'   #get 'static_pages/about'
  get '/contact', to: 'static_pages#contact' #get 'static_pages/contact'
  get '/signup',  to: 'users#new'

  #
  #get 'users/new'
  resources :users
end
