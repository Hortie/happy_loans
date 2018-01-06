class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

#  save ou display  aux cents ou mills
  def get_amout(number)
    return number.to_f / 100
  end
  def get_rate(number)
    return number.to_f / 1000 / 100
  end
  def display_amount(number)
    return "#{ActiveSupport::NumberHelper.number_to_delimited(number.to_f / 100 )} €"
  end
  def display_rate(number)
    return " #{ActiveSupport::NumberHelper.number_to_delimited(number.to_f / 1000 )} %"
  end
  def display_date(number)
    return number.strftime("%d.%m.%Y")
  end
  def save_rate(number)
    return (number * 1000 ).to_i
  end
  def save_amount(number)
    return (number * 100 ).to_i
  end

helper_method :get_amout, :get_rate, :display_amount, :display_rate, :display_date, :save_amount, :save_rate

# get data

  def get_loans_id
   return Loan.where(user_id: current_user).map { |x| x.id }
  end

helper_method :get_loans_id

end
