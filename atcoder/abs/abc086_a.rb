a, b = gets.split.map(&:to_i)

ans = (a * b).odd? ? 'Odd' : 'Even'
puts ans
