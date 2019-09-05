n = gets.to_i
a, b = n.times.map {gets.split.map(&:to_s)}.transpose

M = 10446527
H = []

def get_char(ch)
  if ch == 'A'
    return 1
  elsif ch == 'C'
    return 2
  elsif ch == 'G'
    return 3
  elsif ch == 'T'
    return 4
  end
  0
end

def get_key(s)
  sum = 0
  p = 1

  for i in 0...(s.size)
    sum += p * get_char(s[i])
    p *= 5
  end
  sum
end

def h(key, i)
  (h1(key) + i * h2(key)) % M
end

def h1(key)
  key % M
end

def h2(key)
  1 + (key % (M - 1))
end

def find(s)
  key = get_key(s)
  i = 0

  loop do
    h = h(key, i)
    if H[h] == s
      return true
    elsif H[h].nil?
      return false
    end
    i += 1
  end
end

def insert(s)
  key = get_key(s)
  i = 0

  loop do
    h = h(key, i)
    if H[h] == s
      return
    elsif H[h].nil?
      H[h] = s
      return
    end
    i += 1
  end
end

for i in 0...n
  if a[i][0] == 'i'
    insert(b[i])
  else
    if find(b[i])
      puts 'yes'
    else
      puts 'no'
    end
  end
end
