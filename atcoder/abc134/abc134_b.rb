n, d = gets.split.map(&:to_i)

cnt = 0
num = 0

while n > cnt
  cnt += 2 * d + 1
  num += 1
end
puts num
