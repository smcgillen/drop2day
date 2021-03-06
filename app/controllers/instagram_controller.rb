class InstagramController < ApplicationController
  before_filter :setup_instagram
  # Control passes here once authenticated.
  def index
    @popular = Instagram.media_popular
  end

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => "http://#{@domain_name}/callback", :scope => 'relationships')
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => "http://#{@domain_name}/callback")
    session[:access_token] = response.access_token
    redirect_to '/success'
  end

  def pry
    binding.pry
  end

  def success
    @avatar = Instagram.user()["profile_picture"]
  end

  def load
    @user = User.new(params[:next_cursor])
    @cult_members = @user.followed_by.map(&:username)
    render "load", :layout => false
  end

  def follow
    Instagram.follow_user(params[:id])
    render :json => {status: 'ok'}
  end

  def unfollow
    Instagram.unfollow_user(params[:id])
    render :json => {status: 'ok'}
  end

  def media_popular
    @popular = Instagram.media_popular
  end

  #def logout
    #@popular = Instagram.media_popular
  #end


  def logout
    #self.setup_instagram
    session[:access_token] = nil
    redirect_to '/'
  end



  private
  def setup_instagram
    Instagram.configure do |config|
      config.client_id = "93d9fdaeb4a44f89a1b1a3259922a21f"
      config.client_secret = "22005200a9044ae198975efbc4d30602"
      config.access_token = session[:access_token] if session[:access_token]
    end
  end
end





# CLIENT INFO
# CLIENT ID 93d9fdaeb4a44f89a1b1a3259922a21f
# CLIENT SECRET 4fcb7701013b4c1a8937798f792afa88
# WEBSITE URL https://localhost:3000
# REDIRECT URI  https://localhost:3000









