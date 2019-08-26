a = gets.split.map(&:to_s)
stack = []

a.each do |s|
  if s == '+'
    a = stack.pop
    b = stack.pop
    stack.push(a+b)
  elsif s == '-'
    a = stack.pop
    b = stack.pop
    stack.push(b-a)
  elsif s == '*'
    a = stack.pop
    b = stack.pop
    stack.push(a*b)
  else
    stack.push(s.to_i)
  end
end
puts stack.pop
