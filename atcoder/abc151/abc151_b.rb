n, k, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

ns = a.inject(:+)

(0..k).each do |i|
  if (ns + i) / n >= m
    puts i
    exit
  end
end
puts -1
