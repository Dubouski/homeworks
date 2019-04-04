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
  if number.is_a?(Integer)
    res = fib(number)
  end
  res
end

def task_4_1_b(number)
  # used dynamic programming
  result = 0
  if number.is_a?(Integer)
    puts "run: #{number}"
    res = Array.new(number) {0}
    if res.empty?
      result = 0
    else
      res[0] = 1
      res[1] = 1
      for index in 2...res.size
        res[index] = res [index - 2] + res[index - 1]
      end
      result = res.last
    end
  end
  result
end

def task_4_1(number)
  # use random for two version
  [true, false].sample ? task_4_1_a(number) : task_4_1_b(number)
end



puts task_4_1_a(0)
puts task_4_1_a(1)
puts task_4_1_a(2)
puts task_4_1_a(3)
puts task_4_1_a(4)
puts task_4_1_a(5)
puts task_4_1_a(6)

puts '############################################'


puts task_4_1_b(0)
puts task_4_1_b(1)
puts task_4_1_b(2)
puts task_4_1_b(3)
puts task_4_1_b(4)
puts task_4_1_b(5)
puts task_4_1_b(6)

