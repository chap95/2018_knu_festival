Rails.application.routes.draw do
    
  get '/keyboard' => 'kakao#keyboard'
  post '/message' => 'kakao#message'
  
  root 'site#index'
  get 'site/edit' => 'site#edit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
