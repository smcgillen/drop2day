class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_domain
    if Rails.env.development?
      @domain_name = 'localhost:3000'
    else
      @domain_name = 'drop2day.herokuapp.com/'
    end
  end
end
