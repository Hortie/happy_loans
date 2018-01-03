class LoansController < ApplicationController
  before_action :set_user

  def index
    @loans = Loan.where(user_id: current_user.id)
  end

  def new
    @loan = Loan.new
  end

  def create
    lp = loan_params
    lp[:principal] = (lp[:principal].to_f * 100).round
    lp[:annualRate] = (lp[:annualRate].to_f * 1000).round
    @loan = Loan.new(lp)
    @loan.user = @user
    if @loan.save
      redirect_to new_loan_schedule_path(@loan.id)
    else
      render :new
    end
  end

  def keep_to_true
    Loan.find(params[:id]).update(tokeep: true)
    Schedule.get_schedule(params[:id]).map { |item| item.update(tokeep: true) }
    destroy_others
  end

  def destroy
    Loan.find(params[:id]).destroy
    Schedule.get_schedule(params[:id]).destroy
    redirect_to loans_path
  end

  private

  def set_user
    @user = current_user
  end
  def loan_params
    params.require(:loan).permit(:lender, :borrower, :principal , :termLength, :annualRate, :typeLoan, :frequencyPayment, :firstPaymentDate, :StartingMonthDelayed)
  end

  def destroy_others
    Loan.where(tokeep: false).each {|loan| loan.destroy }
    Schedule.where(tokeep: false).each {|sch| sch.destroy }
    redirect_to loans_path
  end


end
