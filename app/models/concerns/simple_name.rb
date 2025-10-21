module SimpleName
  extend ActiveSupport::Concern

  def full_name
    name
  end
end
