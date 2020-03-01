a1, a2, a3 = 3.times.map{gets.split.map(&:to_i)}
b1, b2, b3 = [a1[0], a2[0], a3[0]], [a1[1], a2[1], a3[1]], [a1[2], a2[2], a3[2]]
c1, c2 = [a1[0], a2[1], a3[2]], [a1[2], a2[1], a3[0]]

arr = [a1, a2, a3, b1, b2, b3, c1, c2]
n = gets.to_i
b = n.times.map{gets.to_i}

arr.each do |a|
  if a.all? {|j| b.include?(j)}
    puts 'Yes'
    exit
  end
end
puts 'No'
