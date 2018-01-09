module LoansHelper
  def stat_by(start_date, end_date)
    start_date ||= 10.year.ago
    end_date ||= Time.current

    line_chart by_day_api_loans_path(start_date: start_date, end_date: end_date),
      basic_opts('Capital Due total', start_date, end_date)
  end

  private

  def basic_opts(title, start_date, end_date)
    {
      discrete: true,
      library: {
        title: {text: title, x: -20},
        subtitle: {text: "from #{l(start_date, format: :medium)} to #{l(end_date, format: :medium)}", x: -20},
        yAxis: {
          title: {
            text: 'Count'
          }
        },
        tooltip: {
          valueSuffix: 'capital due'
        },
        credits: {
          enabled: false
        }
      }
    }
  end
end
