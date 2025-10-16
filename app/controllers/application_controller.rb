class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in, :level_color, :turbo_hash, :turbo_html

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

  def level_color(level, text)
    level_color_html(level, text).html_safe
  end

  def turbo_hash
    { turbo: true, turbo_frame: '_top' }
  end

  def turbo_html
    'data-turbo="true" data-turbo-frame="_top"'
  end

  private

  def level_color_html(level, text)
    '<span class="level-color">' \
    "  <span class=\"#{Level.level_name(level).downcase}\">" \
    "    #{text}" \
    '  </span>' \
    '</span>'
  end
end
