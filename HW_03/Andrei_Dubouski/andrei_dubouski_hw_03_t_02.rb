def valid_v4?(addr)
  block = /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/
  re = /\A#{block}\.#{block}\.#{block}\.#{block}\ /
  addr.scan(re).first
end

def get_date(date)
  # for example 23/Apr/2018:20:30:39 +0300
  date.scan(/\[(.*?)\]/).flatten.first
end

def get_route(msg)
  # "POST /test/2/run HTTP/1.1" 200 - 0.2277""
  msg.scan(%r{\/[a-zA-Z]+\/[0-9a-zA-Z]+\/[0-9a-zA-Z]+}).first
end

def task_2(str)
  array = []
  if str.is_a?(String)
    str.each_line do |line|
      if line.is_a?(String) && line.downcase.include?('error')
        puts "some error in line: #{line}"
      else
        ip = valid_v4?(line)
        date = get_date(line)
        route = get_route(line)
        array << "#{date} FROM #{ip}TO #{route.upcase}"
      end
    end
  end
  array
end