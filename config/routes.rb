Insta::Application.routes.draw do

  get '/' => 'instagram#index'

  get '/insta/connect' => 'instagram#connect'
  get '/callback' => 'instagram#callback'

  get '/success' => 'instagram#edit'
  get '/pry' => 'instagram#pry'

end
