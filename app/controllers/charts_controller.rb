class ChartsController < ApplicationController

  def loans_by_borrower
    result = Loan.group(:borrower).count
    render json: [{name: 'Count', data: result}]
  end

  def initial_capital_by_borrower
    result = Loan.where(user_id: current_user, tokeep: true).group("borrower").select("borrower").sum(:principal)
    render json: [{ name: 'Total Emprunté inital' , data: result }]
  end

  def due_per_period
    loan_ids = Loan.where(user_id: current_user).map { |x| x.id }
    result = Schedule.where(loan_id: loan_ids, tokeep: true).group_by_year(:due_date, format: "%Y").sum("principal_due / 100")
    render json: [{ name: 'Capital annuel à rembourser' , data: result }]
  end

end
