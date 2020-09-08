class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :event_has_subscriptions?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:password, :password_confirmation, :current_password]
    )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def event_has_subscriptions?
    Subscription.find_by(event_id: @event.id).present?
  end
end
