class DashboardsController < ApplicationController
  def show
    @text_subject = TextSubject.new 
    followed_users = current_user.followed_users
    @shouts = Shout.where(user_id: followed_users).order(created_at: :desc)
  end
end
