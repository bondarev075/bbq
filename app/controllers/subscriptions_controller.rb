class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  def create
    message = I18n.t('controllers.subscription.error')

    unless author_email?(subscription_params[:user_email])
      @new_subscription = @event.subscriptions.build(subscription_params)
      @new_subscription.user = current_user
      if @new_subscription.save
        redirect_to @event, notice: I18n.t('controllers.subscription.created')
      end
    else
      message = I18n.t('controllers.subscription.event_author_cant_sign_on_his_event')
    end

    flash.now[:error] = message
    render 'events/show'
  end

  def destroy
    message = { notice: I18n.t('controllers.subscription.destroyed') }

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = { alert: I18n.t('controllers.subscription.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end

  def author_email?(email)
    @event.user.email == email
  end
end
