a, b, c = gets.split.map(&:to_i)

ans = (b + c) - a
if ans < 0
  ans = 0
end
puts "#{ans}"
