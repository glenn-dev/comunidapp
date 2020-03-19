class BillingsController < ApplicationController

  def pre_pay
    bill = Bill.where(department_id: current_user.department_id, status: false)
      total_bill = []
      bill.each do |b|
        total_bill << b.total.to_i
      end
      total_bill.inject(:+)

    payment = PayPal::SDK::REST::Payment.new(
      {
        intent: "sale",
        payer: {
        payment_method: "paypal" },
        redirect_urls: {
        return_url: "http://localhost:3000/billings/execute",
        cancel_url: "http://localhost:3000/" },
        transactions: [{
          :item_list => {
            :items => [{
              :name => "item",
              :sku => "item",
              :price => "200",
              :currency => "USD",
              :quantity => 1 }]},
        amount: {
        total: "200",
        currency: "USD" },
        description: "Compra desde E-commerce Rails." }]
       }
    )
    

    if payment.create
      #Redirige a PayPal
      redirect_url = payment.links.find{|v| v.method == "REDIRECT"}.href
      redirect_to redirect_url
     else
      render json: payment.error
    end
  end

  def execute
    paypal_payment =
    PayPal::SDK::REST::Payment.find(params[:paymentId])

    if paypal_payment.execute(payer_id: params[:PayerID])

      amount = paypal_payment.transactions.first.amount.total

      billing = Billing.create(
      user: current_user,
      code: paypal_payment.id,
      payment_method: 'paypal',
      amount: amount,
      currency: 'USD'
      )

      bill = Bill.where(department_id: current_user.department_id, status: false)
      # bills = current_user.orders.where(payed: false)
      bill.update_all(status: true, billing_id: billing.id)
      # orders.update_all(payed: true, billing_id: billing.id)

      redirect_to root_path, notice: "La compra se realizó con éxito!"
    else
      render plain: "No se puedo generar el cobro en PayPal."
    end
  end

end
