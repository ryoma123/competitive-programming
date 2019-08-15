n = gets.to_i
T, X, Y = n.times.map{gets.split.map(&:to_i)}.transpose

def reachable(i)
  sum = X[i] + Y[i]
  if T[i] >= sum && T[i] % 2 == sum % 2
    return true
  end
  false
end

n.times do |i|
  unless reachable(i)
    puts 'No'
    exit
  end
end
puts 'Yes'
