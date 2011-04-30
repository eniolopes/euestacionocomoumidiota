class AuthenticationsController < ApplicationController

  def index

  end

  def create
    debugger
    response_twitter = request.env["omniauth.auth"]

    auth = Authentication.find_by_uid response_twitter['uid']

    unless auth
      user = User.create(:nickname => response_twitter['user_info']['nickname'],
                :name => response_twitter['user_info']['name'],
                :location => response_twitter['user_info']['location'],
                :image_twitter => response_twitter['user_info']['image'],
                :description => response_twitter['user_info']['description'] )
      auth = Authentication.create(:provider => response_twitter['provider'],
                :uid => response_twitter['uid'], :user => user)
    end

    flash[:notice] = "Authentication successful."

    session[:user_logged] = true
    session[:name] = auth.user.name
    session[:nickname] = auth.user.nickname

    redirect_to root_url
  end

  def destroy
    session[:user_logged] = nil
    session[:nickname] = nil
    redirect_to root_url
  end
end

