class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_user
  helper_method :logged_in?
  
  protected
  def logged_in?
    @current_user.is_a?(Login)
  end
  
  def initialize_user
    @current_user = Login.find_by_id(session[:user]) if session[:user]
  end
end