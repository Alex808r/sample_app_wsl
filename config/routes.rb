Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  # get 'static_pages/home' - Обратите внимание, что теперь предыдущий маршрут static_pages/home больше не будет работать
  # так как он определен корневым маршуртом при помощи root

  get 'static_pages/help'
  get 'static_pages/about'

  #root 'application#hello'
end
