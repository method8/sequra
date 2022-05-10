require 'sidekiq-scheduler'

class WeeklyDisbursementWorker
  include Sidekiq::Worker

  def get_fee(amount)
    return 0.01   if amount < 50
    return 0.0095 if amount >= 50 and amount <= 300
    return 0.0085 if amount > 300
  end

  def disbursement_amount(amount)
    amount - (amount * get_fee(amount))
  end

  def perform(*args)
    orders = Order.not_disbursed

    orders.each do |order|
      disbursement = Disbursement.where('order_id = ?', order['id'])

      if disbursement.none?
        Disbursement.create(
          order_id: order['id'],
          merchant_id: order['merchant_id'],
          fee: get_fee(order['amount']),
          disbursed_amount: disbursement_amount(order['amount']),
          created_at: Time.now.getutc
        )
        order.update(paid:true)
      end
    end
  end
end
