class SchedulesController < ApplicationController

  def new
    @loan = Loan.find(params[:loan_id])
    @schedule = Schedule.get_table(params[:loan_id])
    if @schedule.first.nil?
      create_schedule(@loan)
      @schedule = Schedule.get_table(params[:loan_id])
    end
  end


private

  def create_schedule(loan)
    @schedule = Schedule.new

    # case K+I constant
      capital = loan[:principal].to_f / 100
      periode = 12
      tx_periode = ((loan[:annualRate].to_f/1000/100) / periode)
      nb_echeance = loan[:termLength] * periode
      mensualite = (capital * tx_periode / (1-(1 + tx_periode)**(-nb_echeance))).to_f.round(2)
      firstDate = loan[:firstPaymentDate]

    i = 0
    @table_schedule = []
    principalBalance = capital
    nb_echeance.times do
      newsch = Schedule.new
      newsch.loan_id = loan.id
      newsch.no = i
      newsch.dueDate = firstDate + i.months
      interestDue = (principalBalance * tx_periode).to_f.round(2)
      newsch.interestDue = interestDue * 100
      principalDue = mensualite - interestDue
      newsch.principalDue = principalDue * 100
      newsch.paymentDue = mensualite  * 100
      principalBalance = principalBalance - principalDue
      newsch.principalBalance = principalBalance  * 100
      newsch.save
      i += 1
      end
  end

end
