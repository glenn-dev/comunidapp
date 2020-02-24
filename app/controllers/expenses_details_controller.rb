class ExpensesDetailsController < ApplicationController
  before_action :set_expenses_detail, only: [:show, :edit, :update, :destroy]

  # GET /expenses_details
  # GET /expenses_details.json
  def index
    @expenses_details = ExpensesDetail.all
  end

  # GET /expenses_details/1
  # GET /expenses_details/1.json
  def show
  end

  # GET /expenses_details/new
  def new
    @expenses_detail = ExpensesDetail.new
  end

  # GET /expenses_details/1/edit
  def edit
  end

  # POST /expenses_details
  # POST /expenses_details.json
  def create
    @expenses_detail = ExpensesDetail.new(expenses_detail_params)

    respond_to do |format|
      if @expenses_detail.save
        format.html { redirect_to @expenses_detail, notice: 'Expenses detail was successfully created.' }
        format.json { render :show, status: :created, location: @expenses_detail }
      else
        format.html { render :new }
        format.json { render json: @expenses_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses_details/1
  # PATCH/PUT /expenses_details/1.json
  def update
    respond_to do |format|
      if @expenses_detail.update(expenses_detail_params)
        format.html { redirect_to @expenses_detail, notice: 'Expenses detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @expenses_detail }
      else
        format.html { render :edit }
        format.json { render json: @expenses_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses_details/1
  # DELETE /expenses_details/1.json
  def destroy
    @expenses_detail.destroy
    respond_to do |format|
      format.html { redirect_to expenses_details_url, notice: 'Expenses detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expenses_detail
      @expenses_detail = ExpensesDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expenses_detail_params
      params.require(:expenses_detail).permit(:amount, :bill_id, :concept_id)
    end
end
