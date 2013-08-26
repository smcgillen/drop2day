Insta::Application.routes.draw do

  get '/' => 'instagram#index'

  get '/insta/connect' => 'instagram#connect'
  get '/callback' => 'instagram#callback'

  get '/success' => 'instagram#edit'
  get '/pry' => 'instagram#pry'

  get '/follow/:id' => 'instagram#follow'
  get '/unfollow/:id' => 'instagram#unfollow'

end
