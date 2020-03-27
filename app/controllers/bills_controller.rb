class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  # before_action :set_expenses_detail, only: [:show, :edit, :update, :destroy]
  # before_action :set_concepts_array, only: [:new, :edit, :create]
  # before_action :set_departments_array, only: [:new, :edit, :create]
  before_action :set_last_bill, only: [:new, :create]
  before_action :set_general_expenses, only: [:new, :create, :edit, :update]
  before_action :defaulting, only: :index


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
    @bill.total = set_total_bill(bill_params)
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
    params = bill_params 
    params[:total] = set_total_bill(bill_params)
    
    respond_to do |format|
      if @bill.update(params)
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

    def set_total_bill(bill)
      # Guarda el % de recaudacion del departamento
      dep_bill = Department.where(id: bill[:department_id])
      collection_bill = dep_bill[0].collection
      # Guarda los detalles de gasto de la boleta
      total_exp_detaills_array = bill[:expenses_details_attributes]
      total_exp_detaills = 0
      total_exp_detaills_array.each do |exp|
        total_exp_detaills = total_exp_detaills + exp[1][:amount].to_i
      end
      # Suma los detalles de gastos de las boletas y el calculo de los gastos generales por el % correspondiente al depto.
      @total = (collection_bill * @sum_total_month) + total_exp_detaills
    end

    def defaulting
      @bills_def = Bill.where(department_id: current_user.department_id, status: false)
    end

    def set_total_bill_edit(bill)
      # Guarda el % de recaudacion del departamento
      dep_bill = Department.where(id: bill[:department_id])
      collection_bill = dep_bill[0].collection
      # Guarda los detalles de gasto de la boleta
      total_exp_detaills_array = bill[:expenses_details_attributes]
      total_exp_detaills = 0
      total_exp_detaills_array.each do |exp|
        total_exp_detaills = total_exp_detaills + exp[1][:amount].to_i
      end
      # Suma los detalles de gastos de las boletas y el calculo de los gastos generales por el % correspondiente al depto.
      @total_edit = (collection_bill * @sum_total_month) + total_exp_detaills
    end
end