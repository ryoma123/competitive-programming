N = gets.to_i
A = gets.split.map(&:to_i)
q = gets.to_i
m = gets.split.map(&:to_i)

def solve(i, m)
  return true if m == 0
  return false if i >= N
  res = solve(i+1, m) | solve(i+1, m - A[i])
  return res
end

m.each do |m|
  if solve(0, m)
    puts 'yes'
  else
    puts 'no'
  end
end
