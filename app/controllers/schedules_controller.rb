class SchedulesController < ApplicationController

  def create
    @loan = Loan.find(params[:id])
    @schedule = Schedule.newfrom(@loan)
  end


end
