class GeneralExpensesController < ApplicationController
  before_action :set_general_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_concepts_array, only: [:new, :edit, :create]
  load_and_authorize_resource

  # GET /general_expenses
  # GET /general_expenses.json
  def index
    if current_user.user_type_id == 1
      @general_expenses = GeneralExpense.all
    else
      @general_expenses = GeneralExpense.where(building_id: current_user.building_id)    
    end
  end

  # GET /general_expenses/1
  # GET /general_expenses/1.json
  def show
  end

  # GET /general_expenses/new
  def new
    @general_expense = GeneralExpense.new
  end

  # GET /general_expenses/1/edit
  def edit
  end

  # POST /general_expenses
  # POST /general_expenses.json
  def create
    @general_expense = GeneralExpense.new(general_expense_params)

    respond_to do |format|
      if @general_expense.save
        format.html { redirect_to @general_expense, notice: 'General expense was successfully created.' }
        format.json { render :show, status: :created, location: @general_expense }
      else
        format.html { render :new }
        format.json { render json: @general_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_expenses/1
  # PATCH/PUT /general_expenses/1.json
  def update
    respond_to do |format|
      if @general_expense.update(general_expense_params)
        format.html { redirect_to @general_expense, notice: 'General expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_expense }
      else
        format.html { render :edit }
        format.json { render json: @general_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_expenses/1
  # DELETE /general_expenses/1.json
  def destroy
    @general_expense.destroy
    respond_to do |format|
      format.html { redirect_to general_expenses_url, notice: 'General expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_expense
      @general_expense = GeneralExpense.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def general_expense_params
      params.require(:general_expense).permit(:amount, :status, :concept_id, :building_id)
    end
end
