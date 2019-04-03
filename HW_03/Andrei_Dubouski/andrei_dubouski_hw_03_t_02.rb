def get_v4?(addr)
  block = /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/
  re = /\A#{block}\.#{block}\.#{block}\.#{block}\ /
  addr.scan(re).first
end

def get_d(date)
  # for example 23/Apr/2018:20:30:39 +0300
  date.scan(/\[(.*?)\]/).flatten.first
end

def get_r(msg)
  # "POST /test/2/run HTTP/1.1" 200 - 0.2277""
  msg.scan(%r{\/[a-zA-Z]+\/[0-9a-zA-Z]+\/[0-9a-zA-Z]+}).first
end

def res_msg(line)
  "#{get_d(line)} FROM #{get_v4?(line)}TO #{get_r(line).upcase}"
end

def process(str)
  arr = []
  str.each_line do |line|
    if line.is_a?(String) && line.downcase.include?('error')
      puts "some error in line: #{line}"
    else
      arr << res_msg(line)
    end
  end
  arr
end

def task_2(str)
  if str.is_a?(String)
    process(str)
  else
    []
  end
end
