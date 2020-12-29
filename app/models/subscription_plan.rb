class SubscriptionPlan < ActiveRecord::Base
  monetize :price_cents
  has_many :subscriptions
end
