class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :contenido

  validates :titulo, presence: true
  validates :contenido, presence: true

  scope :nuevos, -> {order('created_at desc')} 

  after_create :send_to_action_cable

  def self.all_for_user(user)
    Post.where(user: user)
    .or(Post.where(user_id: user.friends_ids))
    .or(Post.where(user_id: user.users_ids))
  end

  private
    def send_to_action_cable
      data = {message: to_html, action: 'new_post'}

      self.user.friends_ids.each do |friend_id|
        ActionCable.server.broadcast "posts_#{friend_id}", data
      end

      self.user.users_ids.each do |user_id|
        ActionCable.server.broadcast "posts_#{user_id}", data
      end
    end

    def to_html
      ApplicationController.renderer.render(partial: 'posts/post', locals:{ post: self})
    end
end
