class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  before_filter :set_user

  def set_user
  	User.cuser = current_user
  end
end
