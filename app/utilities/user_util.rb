class UserUtil
  attr_accessor :user

  def self.provision_users
    user_data.each do |user|
      UserUtil.new.provision_user(user)
    end
  end

  def provision_user(user)
    @user          = user
    @user.password = '123'
    @user.credits  = 1000
    @user.save

    @user
  end

  def self.user_data
    [
      User.build(email: 'kmwalke@gmail.com', name: 'Kent', location: Location.first,
                 status: UserStatus::STATUSES[:crafting]),
      User.build(email: 'kfretz2@gmail.com', name: 'Keith', location: Location.first, status: UserStatus::STATUSES[:traveling]),
      User.build(email: 'cristin.slaymaker@gmail.com', name: 'Cris', location: Location.first),
      User.build(email: 'kerryslaymaker@gmail.com', name: 'Kerry', location: Location.first),
      User.build(email: 'buttforker@gmail.com', name: 'Zack', location: Location.first),
      User.build(email: 'Aaron.m.lee.al@gmail.com', name: 'Aaron', location: Location.first),
      User.build(email: 'polymangler@gmail.com', name: 'Bruce', location: Location.first),
      User.build(email: 'a@b.com', name: 'Lumber Jack', location: Location.last, status: UserStatus::STATUSES[:gathering]),
      User.build(email: 'b@b.com', name: 'Shifty Rogue', location: Location.last, status: UserStatus::STATUSES[:traveling])
    ]
  end
end
