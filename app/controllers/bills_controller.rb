class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  # before_action :set_expenses_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_concepts_array, only: [:new, :edit, :create]
  before_action :set_departments_array, only: [:new, :edit, :create]
  before_action :set_building_to_bill, only: [:new, :edit, :create]
  before_action :set_last_bill, only: [:new, :edit, :create]


  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
    @expenses_details = ExpensesDetail.all
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
        byebug
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
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
      params.require(:bill).permit(:num_bill, :issue_date, :status, :bill_doc, :paid_doc, :department_id, :building_id, expenses_details_attributes: [:amount, :concept_id, :id, :_destroy ])
    end

    def set_concepts_array
      @concept_array = Concept.order(:name).pluck(:name, :id)
    end

    def set_departments_array
      @department_array = Department.order(:num_dep).pluck(:num_dep, :id)
    end

    # Trae el edificio que ccorresponde
    def set_building_to_bill
      @building = Building.find(current_user.building_id)
    end

    def set_last_bill
      @last_bill = Bill.all[-1]
    end
end