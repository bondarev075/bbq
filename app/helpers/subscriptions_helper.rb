module SubscriptionsHelper
  def event_has_subscribers(event)
    Subscription.where(event_id: event.id).present?
  end
end
