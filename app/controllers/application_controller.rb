class ApplicationController < ActionController::Base
  helper_method :player, :logged_in, :level_color_span, :level_name

  def player
    if session[:user_id]
      @player ||= User.find(session[:user_id])
    else
      @player = nil
    end
  end

  def logged_in
    return unless player.nil?

    session[:orig_destination] = request.path
    redirect_to login_path
  end

  def level_color_span(level, text)
    "  <span class=\"#{level_name(level)}\">" \
      "    #{text}" \
      '  </span>'.html_safe
  end

  def level_name(level)
    Level.level_name(level).downcase
  end

  private

  def game_action(redirect: true, path: game_path)
    ActiveRecord::Base.transaction do
      yield
    rescue CraftyError => e
      @notice = e.to_s
    ensure
      redirect_to path, notice: @notice if redirect
    end
  end
end
