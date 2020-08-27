class Event < ApplicationRecord

  validates :title, precense: true, length: {maximum: 255}
  validates :address, precense: true
  validates :datetime, precense: true
end
