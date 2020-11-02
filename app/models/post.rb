class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :contenido

  validates :titulo, presence: true
  validates :contenido, presence: true
end
