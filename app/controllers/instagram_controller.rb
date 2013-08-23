class InstagramController < ApplicationController

  # Control passes here once authenticated.
  def index
  end

  def connect
    self.setup_instagram
    redirect_to Instagram.authorize_url(:redirect_uri => 'http://localhost:3000/callback')
  end

  def callback
    self.setup_instagram
    response = Instagram.get_access_token(params[:code], :redirect_uri => 'http://localhost:3000/callback')
    session[:access_token] = response.access_token
    redirect_to '/success'
  end

  def success
    self.setup_instagram
    # binding.pry
  end

  def pry
    self.setup_instagram
    binding.pry
  end

  def edit
    @user = User.new
  end



  def setup_instagram
    Instagram.configure do |config|
      config.client_id = "b83395640aec496fbe4eb7f340fde84a"
      config.client_secret = "a97872f648f546b78eca87518a162074"
      config.access_token = session[:access_token] if session[:access_token]
    end
  end

end
