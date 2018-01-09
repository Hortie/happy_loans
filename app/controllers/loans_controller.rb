class LoansController < ApplicationController
  before_action :set_user

  def index
    if params["sdate"] != nil
      @sdate = params["sdate"]
    else
      @sdate = Time.now
    end
    @loans = Loan.where(user_id: current_user.id)
    ids = @loans.map { |ll| ll.id }
    @schedules = Schedule.where(loan_id: ids)
  end

  def new
    @loan = Loan.new
    lenders_borrowers
  end

  def create
    lp = loan_params
    lp[:principal] = (lp[:principal].to_f * 100).round
    lp[:annual_rate] = (lp[:annual_rate].to_f * 1000).round
    @loan = Loan.new(lp)
    @loan.user = @user
    if @loan.save
      redirect_to new_loan_schedule_path(@loan.id)
    else
        # @loan.update(lender: "")
        # @loan.update(borrower: "")
      lenders_borrowers
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
    redirect_to loans_path
  end

  private

  def set_user
    @user = current_user
  end
  def loan_params
    params.require(:loan).permit(:lender, :borrower, :principal , :term_length, :annual_rate, :type_loan, :frequency_payment, :first_payment_date, :starting_month_delayed)
  end

  def destroy_others
    Loan.where(tokeep: false).each {|loan| loan.destroy }
    redirect_to loans_path
  end

  def lenders_borrowers
    @lenders = Loan.where(user_id: current_user.id).where(tokeep: true).map {|l| l.lender}.uniq
    @lenders << "Autre"
    @borrowers = Loan.where(user_id: current_user.id).where(tokeep: true).map {|l| l.borrower}.uniq
    @borrowers << "Autre"
  end

end
