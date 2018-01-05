class ChartsController < ApplicationController

  def loans_by_borrower
    result = Loan.group(:borrower).count
    render json: [{name: 'Count', data: result}]
  end

  def initial_capital_by_borrower
    result = Loan.where(user_id: current_user).group("borrower").select("borrower").sum(:principal)

    render json: [{ name: 'Total Emprunté inital' , data: result }]
  end


end
