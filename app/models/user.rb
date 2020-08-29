class User < ApplicationRecord
  has_many :events

  validates :name, presense: true, length: { maximum: 35 }
  validates :email, presense: true, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w\d\.-_]+@{1}[\w\d]+\.\w+\z/ }
end
