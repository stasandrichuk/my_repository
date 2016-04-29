class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  before_filter :set_user

  def set_user
  	User.cuser = current_user
  	@users = User.all
  	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  	  marker.lat user.latitude
  	  marker.lng user.longitude
  	end
    @g_key = "AIzaSyCMl4aZmSFX9mACw1GcwGLUriCcIcj9OZM"
  end
end
