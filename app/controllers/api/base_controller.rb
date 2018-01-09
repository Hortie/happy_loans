class Api::BaseController < ApplicationController

before_action :load_data
before_action :format_dates

private

def load_data
  loan_ids = get_loans_id
  @data_loans = Schedule.where(loan_id: loan_ids)
end

def format_dates
  @start_date = params[:start_date].nil? || params[:start_date].empty? ?
      1.month.ago.midnight :
      params[:start_date].to_datetime.midnight
  @end_date = params[:end_date].nil? || params[:end_date].empty? ?
      Time.current.at_end_of_day :
      params[:end_date].to_datetime.at_end_of_day
  @start_date, @end_date = @end_date, @start_date if @end_date < @start_date
end

def by_year?
  @end_date - (1.year + 2.days) > @start_date
end

def by_month?
  @end_date - (3.month + 2.days) > @start_date
end

end
