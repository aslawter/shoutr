class User < ActiveRecord::Base
  paginates_per 5

  def to_param
    username
  end

  has_many :shouts

  has_many :followed_user_relationships,
    class_name: "FollowingRelationship",
    foreign_key: :follower_id

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    class_name: "FollowingRelationship",
    foreign_key: :followed_user_id

  has_many :followers,
    through: :follower_relationships

  validates :username, uniqueness: true

  def timeline
    Shout.where(user_id: followed_users).order(created_at: :desc)
  end

  def follow(other_user)
    followed_users << other_user
  end

  def following?(other_user)
    followed_user_ids.include?(other_user.id)
  end

  def unfollow(other_user)
    followed_users.destroy(other_user)
  end
end
