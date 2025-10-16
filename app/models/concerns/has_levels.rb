module HasLevels
  extend ActiveSupport::Concern

  def level_name
    Level.level_name(level)
  end
end
