class BillingsController < ApplicationController

  # SUM ALL PENDINGS BILLS #
  def set_total_pp
    total_bills = Bill.where(department_id: current_user.department_id, status: false)
    department = Department.where(id: current_user.department_id)
    @num_current_department = department[0].num_dep
    @sum_total_bills = total_bills.sum(&:total)
  end

  def pre_pay
    set_total_pp

    payment = PayPal::SDK::REST::Payment.new(
      {
        intent: "sale",
        payer: {
        payment_method: "paypal" },
        redirect_urls: {
        return_url: "https://afternoon-island-22684.herokuapp.com/billings/execute",
        cancel_url: "https://afternoon-island-22684.herokuapp.com/" },
        transactions: [{
          :item_list => {
            :items => [{
              :name => "Total boletas pendientes del departamento #{@num_current_department}",
              :sku => "Deuda pendiente",
              :price => @sum_total_bills,
              :currency => "USD",
              :quantity => 1 }]},
        amount: {
        total: @sum_total_bills,
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
