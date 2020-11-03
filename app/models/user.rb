class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :friendships
  has_many :followers, class_name: 'Friendship', foreign_key: 'friend_id'

  #has_many :friends_added, through: :friendships, source: :friend
  #has_many :friends_who_added, through: :friendships, source: :user

  has_one_attached :cover
  has_one_attached :avatar

  def friends_ids
    Friendship.active.where(user: self).pluck(:friend_id)
  end

  def users_ids
    Friendship.active.where(friend: self).pluck(:user_id)
  end

  def my_friend?(friend)
    Friendship.friends?(self, friend)
  end
end
