Insta::Application.routes.draw do

  get '/' => 'instagram#index'

  get '/insta/connect' => 'instagram#connect'
  get '/callback' => 'instagram#callback'

  get '/success' => 'instagram#success'
  get '/load' => 'instagram#load'
  get '/pry' => 'instagram#pry'
  get '/logout' => 'instagram#logout'

  get '/follow/:id' => 'instagram#follow'
  get '/unfollow/:id' => 'instagram#unfollow'

end
