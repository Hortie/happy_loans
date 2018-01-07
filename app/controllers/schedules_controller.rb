class SchedulesController < ApplicationController

  def new
    @loan = Loan.find(params[:loan_id])
    @schedule = Schedule.get_schedule(params[:loan_id])
    if @schedule.first.nil?
      create_schedule(@loan)
      @schedule = Schedule.get_schedule(params[:loan_id])
    end
  end

  private

  def create_schedule(loan) #tout est calculé en cents
    periode = get_periode(loan.frequency_payment)
    capital = loan[:principal]  # en cents
    tx_periode = get_rate(loan[:annual_rate]) / periode
    nb_echeance = loan[:term_length] / 12 * periode
    mensualite = (capital * tx_periode / (1-(1 + tx_periode)**(-nb_echeance))).round # en cents
    dueDate = loan[:first_payment_date]

    principalBalance = capital
    #Case of some month delayed
    i = 1
      if !loan.starting_month_delayed.nil?
        loan.starting_month_delayed.times do
        interestDue = (principalBalance * tx_periode).round
        principalDue = 0
        principalBalance = principalBalance
        dueDate = dueDate + 1.months
        newsch = Schedule.create(loan_id: loan.id, no: i, due_date: dueDate, interest_due: interestDue,
          principal_due: principalDue, payment_due: mensualite, principal_balance: principalBalance)
        i += 1
      end
    end

     # echence à npartir du remboursmenet du capital
    (nb_echeance - 1).times do
      interestDue = (principalBalance * tx_periode).round
      principalDue = (mensualite - interestDue).round
      principalBalance = principalBalance - principalDue
      dueDate = dueDate + (12 / periode).months
      newsch = Schedule.create(loan_id: loan.id, no: i, due_date: dueDate, interest_due: interestDue,
        principal_due: principalDue, payment_due: mensualite, principal_balance: principalBalance)
      i += 1
      end
    # last echeance to get exact capital to reimburse
      interestDue = (principalBalance * tx_periode).round
      principalDue = principalBalance
      mensualite = principalDue + interestDue
      principalBalance = 0
      dueDate = dueDate + (12 / periode).months
      newsch = Schedule.create(loan_id: loan.id, no: i, due_date: dueDate, interest_due: interestDue,
        principal_due: principalDue, payment_due: mensualite, principal_balance: principalBalance)
  end

  def get_periode(frequency)
    case frequency
    when "mensuelles"
      return 12
    when "trimestrielles"
      return 4
    when "semestrielles"
      return 2
    when "annuelles"
      return 1
    end
  end

end


