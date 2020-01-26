n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

if n == k
  c = 0
elsif k == 0
  c = a.sort.inject(&:+)
else
  c = a.sort[0...-k].inject(&:+)
end
puts c.nil? ? 0 : c
