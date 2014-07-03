class RemoveEmailCharactersFromUserNameInUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.all.each do |user|
      username = user.username.split("@").first
      user.username = username
      user.save
    end
  end
end
