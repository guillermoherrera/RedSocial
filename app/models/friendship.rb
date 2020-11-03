class Friendship < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user_id, uniqueness: {scope: :friend_id, message: "Amistad duplicada"}

  aasm column: "status" do
    state :pending, initial: true
    state :active
    state :denied

    event :accepted do
      transitions from: [:pending], to: [:active]
    end

    event :rejected do
      transitions from: [:pending, :active], to: [:denied]
    end
  end
end
