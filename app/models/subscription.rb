class Subscription < ApplicationRecord
  enum status: { pending: 0, failed: 1, paid: 2 }
  enum payment_gateway: { stripe: 0 }
  belongs_to :subscription_plan
  belongs_to :user

  scope :recently_created, -> { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paid
    self.status = Subscription.statuses[:paid]
  end

  def set_failed
    self.status = Subscription.statuses[:failed]
  end
end
