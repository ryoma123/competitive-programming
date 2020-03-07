n, b, r = gets.split.map(&:to_i)

cnt = 0
br = b + r

if b >= n
  puts n
  exit
end

if br > n
  if b > n
    puts 0
  else
    puts b
  end
  exit
end

c = n / br
cnt += c * b

if c * br < n
  if n - (c * br) > b
    cnt += b
  else
    cnt += n - (c * br)
  end
end
puts cnt
