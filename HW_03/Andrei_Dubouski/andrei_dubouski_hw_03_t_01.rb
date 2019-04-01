def task_1(str)
  result = ''
  if str.is_a?(String) && str.downcase.include?('error')
    result = str
  end
  return result
end
