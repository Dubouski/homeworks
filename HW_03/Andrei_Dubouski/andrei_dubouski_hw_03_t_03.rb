def get_date(date)
  # 2018-04-23 17:17:49.7 ubuntu[14319] Debug - Calling core with action: event
  date.scan(/(.*) ubuntu/).flatten.first
end

require 'time'

def task_3(str)
  event_time = []
  if str.is_a?(String)
    str.each_line do |line|
      if line.include?('Calling core with action:')
        date = get_date(line)
        event_time << Time.parse(date)
      end
    end
  end
  event_time.size == 2 ? (event_time[1] - event_time[0]).to_s : '0'
end
