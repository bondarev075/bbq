class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true,
                         format: { with: /\A[\w\d\.-_]+@[\w\d]+\.\w+\z/ },
                         unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :self_event_subscription

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
    if event.user.email == user_email
      errors.add(:user_email, I18n.t('subscriptions.subscription.self_event_subscription'))
    end
  end
end
