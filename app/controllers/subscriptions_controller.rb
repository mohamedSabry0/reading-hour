class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  def index
    subscription_plan = SubscriptionPlan.all
    @plan_purchases = subscription_plan.where(stripe_plan_name: nil)
    # @products_subscription = products - @products_purchase
  end

  def submit; end
end
