class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :contenido

  validates :titulo, presence: true
  validates :contenido, presence: true

  scope :nuevos, -> {order('created_at desc')} 

  def self.all_for_user(user)
    Post.where(user: user)
    .or(Post.where(user_id: user.friends_ids))
    .or(Post.where(user_id: user.users_ids))
  end
end
