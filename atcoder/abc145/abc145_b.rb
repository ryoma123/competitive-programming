n = gets.to_i
s = gets.chomp
puts n == 1 || s[0..n / 2 - 1] != s[n / 2..-1] ? 'No' : 'Yes'
