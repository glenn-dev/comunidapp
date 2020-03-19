class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  # before_action :set_expenses_detail, only: [:show, :edit, :update, :destroy]
  # before_action :set_concepts_array, only: [:new, :edit, :create]
  # before_action :set_departments_array, only: [:new, :edit, :create]
  before_action :set_last_bill, only: [:new, :create]
  before_action :set_general_expenses, only: [:new, :create, :edit, :update]
  before_action :set_total_bill, only: [:create]

  # GET /bills
  # GET /bills.json
  def index
    if current_user.user_type_id == 1
      @bills = Bill.order(created_at: :desc)
    elsif current_user.user_type_id == 2
      @bills = Bill.where(building_id: current_user.building_id).order(created_at: :desc)
    else
      @bills = Bill.where(department_id: current_user.department_id).order(created_at: :desc)
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @bill.expenses_details.build
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
    # Set total to current bill
    @bill.update(total: set_total_bill(@bill))
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :index, status: :created, location: @bill }
        format.js
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

     # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(
        :num_bill, 
        :issue_date, 
        :status, 
        :bill_doc, 
        :paid_doc, 
        :department_id, 
        :building_id, 
        :total, 
        expenses_details_attributes: [
          :amount, 
          :concept_id, :id, 
          :building_id, 
          :_destroy 
          ]
        )
    end

    def set_last_bill
      @last_bill = Bill.where(building_id: current_user.building_id).last
    end

    def set_general_expenses
      current_general_expense = GeneralExpense.where(["building_id = ? and created_at < ?", current_user.building_id, Time.now])
      @sum_total_month = current_general_expense.sum(&:amount)
    end

    def set_total_bill(bill_p)
      # Guarda el % de recaudacion del departamento
      collection_bill = Department.where(department_id: bill_p.department_id).collection 
      # Guarda los detalles de gasto de la boleta
      total_exp_detaills = ExpensesDetail.where(bill_id: bill_p.id)
      # Suma los detalles de gastos de las boletas y el calculo de los gastos generales por el % correspondiente al depto.
      @total = (collection_bill * @sum_total_month) + total_exp_detaills.sum(&:amount)
      # Guarda la boleta en cuestion en una variable
      bill = Bill.where(id: bill_p.id, status: false)
      # Hace el update de la boleta con el total previamente calculado.
      bill.update_all(total: @total)
    end

      # bills = current_user.orders.where(payed: false)
      # orders.update_all(payed: true, billing_id: billing.id)
end