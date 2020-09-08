class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: /\A[\w\d\.-_]+@{1}[\w\d]+\.\w+\z/ }, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :event_author_subscription_denied

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

  def event_author_subscription_denied
    if event.user.email == user_email
      errors.add(:user_email, I18n.t('controllers.subscription.event_author_subscription_denied'))
    end
  end
end
