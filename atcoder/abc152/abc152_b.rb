a, b = gets.split.map(&:to_i)

ab = (a.to_s * b).to_i
ba = (b.to_s * a).to_i
puts [ab, ba].sort.reverse[0]
