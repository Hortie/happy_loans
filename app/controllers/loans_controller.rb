class LoansController < ApplicationController
  before_action :set_user

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = @user
    if @loan.save
      redirect_to loans_path
    else
      render :new
    end
  end


  private

  def set_user
    @user = current_user
  end
  def loan_params
    params[:loan][:principal] = (params[:loan][:principal].to_f * 100).to_i
    params.require(:loan).permit(:lender, :borrower, :principal , :termLength, :annualRate, :typeLoan, :frequencyPayment, :firstPaymentDate, :StartingMonthDelayed)
  end

end
