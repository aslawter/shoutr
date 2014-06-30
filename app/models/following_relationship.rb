class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower
  belongs_to :followed_user, class_name: "User"
end
