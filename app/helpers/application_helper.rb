module ApplicationHelper

# capital restant du, last due_date
def capital_restant_du(loan, ddate)
  ss = Schedule.where(loan_id: loan.id).where("due_date > ?", ddate).order(:due_date).first
  return display_amount(ss.principal_balance)
end

def capital_restant_du_total(ddate)
  loan_ids = get_loans_id
  sum = 0
  loan_ids.each do |id|
    ss = Schedule.where(loan_id: id).where("due_date > ?", ddate).order(:due_date).first
    sum +=  ss.principal_balance
  end
  return display_amount(sum)
end

def last_due_date(loan, ddate)
  ss = Schedule.where(loan_id: loan.id).order(:due_date).last
  return display_date(ss.due_date)
end


# ********CHARTS ****************
def loans_by_borrower
  bar_chart @loans.group(:borrower).count, height: '500px'
end

def initial_capital_by_borrower
  column_chart initial_capital_by_borrower_charts_path, stacked: true
end

def due_per_period
  column_chart due_per_period_charts_path, stacked: true,  legend: false,  download: true, height: '500px', width: '800px', xtitle: "Années", ytitle: "Capital due"
end

end
