class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    !session[:user_id].nil?
  end

  def all_users
    @all_users = User.all
  end

  helper_method :current_user, :logged_in, :all_users
end
