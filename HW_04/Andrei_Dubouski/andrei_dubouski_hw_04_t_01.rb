def fib(n)
  case n
  when 0
    0
  when 1
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end

def task_4_1_a(number)
  # used recursion
  res = 0
  number.is_a?(Integer) ? fib(number) : res
end

def task_4_1_b(number)
  # used dynamic programming
  result = 0
  if number.is_a?(Integer)
    res = Array.new(number) { 0 }
    return 0 if res.empty?
    res[0] = 1
    res[1] = 1
    (2...res.size).each { |ind| res[ind] = res [ind - 2] + res[ind - 1] }
    result = res.last
  end
  result
end

def task_4_1(number)
  # use random for two version
  [true, false].sample ? task_4_1_a(number) : task_4_1_b(number)
end