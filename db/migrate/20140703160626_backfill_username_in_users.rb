class BackfillUsernameInUsers < ActviveRecord::Migration
  class User < ActiveRecord::Migration
  end

  def up
    User.all.each do |user|
      if username == NULL
        email = user.email.chomp("@")
        user.username = user.email
        user.save
      end
    end

    remove_column :users, :email
    change_column_null :users, :username, false
  end

  def down
    change_column_null :users, :username, true
    add_column :users, :email

    User.all.each do |user|
      user.email = "#{user.username} + @shoutr.com"
      user.username = NULL 
      user.save  
    end
  end
end

