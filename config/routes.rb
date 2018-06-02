Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  
  #post
  get '/post/write'
  post '/post' => 'post#create'
  get '/post/:id' => 'post#show'
  get '/post/edit/:id' => 'post#edit'
  post '/post/update/:id' => 'post#update'
  delete '/post/:id' => 'post#delete'
  
  
  #comment
  post '/comment/:id' => 'comment#create'
  delete '/comment/:id' => 'comment#delete'

end
