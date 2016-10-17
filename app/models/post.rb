class Post < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id
  def editable_by?(user)
    user && user == owner
  end

  has_many :comments
end
