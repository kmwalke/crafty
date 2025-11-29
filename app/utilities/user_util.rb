class UserUtil
  attr_accessor :user

  def self.provision
    user_data.each do |user_params|
      user_params[:credits]       = 1000
      user_params[:location_id] ||= Location.first.id
      user                        = User.find_or_create_by(user_params)
      user.password               = '123'
      user.save
    end
  end

  def self.user_data
    [
      { email: 'kmwalke@gmail.com', name: 'Kent', status: UserStatus::STATUSES[:crafting] },
      { email: 'kfretz2@gmail.com', name: 'Keith', status: UserStatus::STATUSES[:traveling] },
      { email: 'cristin.slaymaker@gmail.com', name: 'Cris' },
      { email: 'kerryslaymaker@gmail.com', name: 'Kerry' },
      { email: 'buttforker@gmail.com', name: 'Zack' },
      { email: 'Aaron.m.lee.al@gmail.com', name: 'Aaron' },
      { email: 'polymangler@gmail.com', name: 'Bruce' },
      { email: 'a@b.com', name: 'Lumber Jack', location_id: Location.last.id, status: UserStatus::STATUSES[:gathering] },
      { email: 'b@b.com', name: 'Shifty Rogue', location_id: Location.last.id, status: UserStatus::STATUSES[:traveling] }
    ]
  end
end
