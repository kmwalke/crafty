class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in, :level_color, :level_name

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

  def level_name(level)
    Level.level_name(level).downcase
  end

  private

  def level_color_html(level, text)
    "  <span class=\"#{level_name(level)}\">" \
    "    #{text}" \
    '  </span>'
  end

  def game_action(redirect: true, path: game_path)
    yield
  rescue CraftyError => e
    @notice = e.to_s
  ensure
    redirect_to path, notice: @notice if redirect
  end
end
