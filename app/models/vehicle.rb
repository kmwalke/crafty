class Vehicle < Item
  has_one :user

  def actions
    %w[travel]
  end

  def travel(location); end
end
