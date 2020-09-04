class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :check_name, on: :create

  private

  def check_name
    self.name = self.email[/.+(?=@.+)/] if self.name.blank?
  end
end
