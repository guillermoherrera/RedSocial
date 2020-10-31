class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :contenido

  validates :contenido, presence: true
end
