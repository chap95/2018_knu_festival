Rails.application.routes.draw do
    
  resources :posts
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  root 'site#index'
  
  get '/jau' => 'site#jau'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
