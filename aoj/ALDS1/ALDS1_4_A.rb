n = gets.to_i
s = gets.split.map(&:to_i)
_ = gets.to_i
t = gets.split.map(&:to_i)

sum = 0

def search(s, n, key)
  i = 0
  s[n] = key

  loop do
    break if s[i] == key
    i += 1
  end
  (n == i) ? false : true
end

t.each do |key|
  sum += 1 if search(s, n, key)
end
puts sum
