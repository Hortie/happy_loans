class Api::LoansController < Api::BaseController

# fonction appelé quand on subit le form
def create
  respond_to do |format|
    format.js
  end
end


def by_day
  opts = ['due_date', {range: @start_date..@end_date, format: '%d %b'}]
  method_name = :group_by_day
  if by_year?
    opts[1].merge!({format: '%Y'})
    method_name = :group_by_year
  elsif by_month?
    opts[1].merge!({format: '%b %Y'})
    method_name = :group_by_month
  end
  datas = @data_loans.send(method_name, *opts).count
  render json: [{name: 'count capital', data: datas}].chart_json
end

end
