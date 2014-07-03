class BackfillUsernameInUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.where(username: nil).each do |user|
      username = user.email.split("@").first
      user.username = username
      user.save
    end

    remove_column :users, :email
    change_column_null :users, :username, false
  end

  def down
    change_column_null :users, :username, true
    add_column :users, :email, :string

    User.all.each do |user|
      user.email = user.username + "@shoutr.com"
      user.save
    end
  end
end
