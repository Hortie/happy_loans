class LoansController < ApplicationController
  before_action :set_user

  def new
    @loan = Loan.new
    @user = current_user
  end

  def create
    # @loan = Loan.new(loan_params)
    # # @loan.user = @user
    # @loan.save
  end


  private
  def set_user
    @user = current_user
  end
  def loan_params
    params.require(:loan).permit(:lender, :borrower, :principal, :termLength, :annualRate, :typeLoan, :frequencyPayment, :firstPaymentDate, :StartingMonthDelayed)
  end


end
