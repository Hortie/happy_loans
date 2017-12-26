class LoansController < ApplicationController
  before_action :set_user

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.user = @user
    if @loan.save
      redirect_to new_loan_schedule_path(@loan.id)
    else
      render :new
    end
  end


  private

  def set_user
    @user = current_user
  end
  def loan_params
    params.require(:loan).permit(:lender, :borrower, :principal , :termLength, :annualRate, :typeLoan, :frequencyPayment, :firstPaymentDate, :StartingMonthDelayed)
  end

end
