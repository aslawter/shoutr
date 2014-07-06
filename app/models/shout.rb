class Shout < ActiveRecord::Base
  paginates_per 5

  belongs_to :user
  belongs_to :subject, polymorphic: true

  def body=(new_body)
    self[:body] = new_body.upcase
  end
end
