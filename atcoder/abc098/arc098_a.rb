n = gets.to_i
s = gets.chomp

min = s[1...n].delete('W').size
cnt = min

(1...n).each do |i|
  if s[i] == 'E'
    cnt -= 1
  end
  if s[i - 1] == 'W'
    cnt += 1
  end
  min = cnt if cnt < min
end
puts min
