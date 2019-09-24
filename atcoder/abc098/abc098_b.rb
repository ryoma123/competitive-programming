n = gets.to_i
a = gets.chomp.split('')

max = 0

(1...n-1).each do |i|
  cnt = (a[0..i] & a[i+1...n]).count
  max = cnt if cnt > max
end
puts max
