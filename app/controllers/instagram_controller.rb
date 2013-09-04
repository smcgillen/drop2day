class InstagramController < ApplicationController

  # Control passes here once authenticated.
  def index
  end

  def connect
    self.setup_instagram
    redirect_to Instagram.authorize_url(:redirect_uri => 'http://instadrop.herokuapp.com/callback', :scope => 'relationships')
  end

  def callback
    self.setup_instagram
    response = Instagram.get_access_token(params[:code], :redirect_uri => 'http://instadrop.herokuapp.com/callback')
    session[:access_token] = response.access_token
    redirect_to '/success'
  end

  def pry
    self.setup_instagram
    binding.pry
  end

  def success
    self.setup_instagram
    @avatar = Instagram.user()["profile_picture"]
  end

  def load
    self.setup_instagram
    @user = User.new
    @cult_members = @user.followed_by.map(&:username)
  end

  def follow
    self.setup_instagram
    Instagram.follow_user(params[:id])
    render :json => {status: 'ok'}
  end

  def unfollow
    self.setup_instagram
    Instagram.unfollow_user(params[:id])
    render :json => {status: 'ok'}
  end



  def setup_instagram
    Instagram.configure do |config|
      config.client_id = "93d9fdaeb4a44f89a1b1a3259922a21f"
      config.client_secret = "4fcb7701013b4c1a8937798f792afa88"
      config.access_token = session[:access_token] if session[:access_token]
    end
  end

  def logout
    self.setup_instagram
    session[:access_token] = nil
    redirect_to root_path
  end

end



# CLIENT INFO
# CLIENT ID 93d9fdaeb4a44f89a1b1a3259922a21f
# CLIENT SECRET 4fcb7701013b4c1a8937798f792afa88
# WEBSITE URL https://localhost:3000
# REDIRECT URI  https://localhost:3000









