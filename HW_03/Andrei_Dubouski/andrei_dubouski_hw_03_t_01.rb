def task_1(str)
  str.each_line do |line|
    return line if line.is_a?(String) && line.downcase.include?('error')
  end
  ''
end
