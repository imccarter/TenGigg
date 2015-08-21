class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :log_out

  def current_user
  	@current_user = User.find_by(session_token: session[:session_token])
  end

  def logged_in?
  	!!current_user
  end

  def log_in(user)
  	session[:session_token] = user.reset_session_token!
  end

  def log_out
  	current_user.try(:reset_session_token!)
  	session[:session_token] = nil
  end

  def require_log_in
  	redirect_to 'static_pages#root' unless logged_in?
  end
end
