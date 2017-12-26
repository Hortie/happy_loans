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
    params[:principal] * 100 if !params[:principal].nil?
    params.require(:loan).permit(:lender, :borrower, :principal, :termLength, :annualRate, :typeLoan, :frequencyPayment, :firstPaymentDate, :StartingMonthDelayed)
  end

end
