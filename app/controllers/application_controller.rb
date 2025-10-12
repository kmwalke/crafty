class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in
    return unless current_user.nil?

    session[:orig_destination] = request.path
    redirect_to login_path
  end
end
