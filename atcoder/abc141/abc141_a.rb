s = gets.chomp

a = ['Sunny', 'Cloudy', 'Rainy']

ans = a[a.index(s) + 1]
puts ans.nil? ? a[0] : ans
