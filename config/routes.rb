Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  # get 'static_pages/home'
  #getリクエストが/helpに送信されたとき,static_pagesコントローラーのhelpアクションが呼び出される
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  resources :users
end
