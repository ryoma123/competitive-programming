n = gets.to_i
a = gets.split.map(&:to_i)

num = 0
min = 200000

(0...n).each do |i|
  if a[i] <= min
    num += 1
    min = a[i]
  end
end
puts num
