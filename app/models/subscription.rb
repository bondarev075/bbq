class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true,
                         format: { with: /\A[\w\d\.-_]+@[\w\d]+\.\w+\z/ },
                         unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :self_event_subscription, if: -> { user.present? }
  validate :existing_user_event_subscription, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def self_event_subscription
    errors.add(:base, :self_event_subscription) if event.user == user
  end

  def existing_user_event_subscription
    errors.add(:user_email, :existing_user_event_subscription) if User.exists?(email: user_email)
  end
end
