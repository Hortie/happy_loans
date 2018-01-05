module ApplicationHelper

def loans_by_borrower
  bar_chart @loans.group(:borrower).count, height: '500px'
end

def initial_capital_by_borrower
  column_chart initial_capital_by_borrower_charts_path, stacked: true
end

def due_per_period
  column_chart due_per_period_charts_path, stacked: true
end

end
