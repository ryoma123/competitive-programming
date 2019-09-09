N, K = gets.split.map(&:to_i)
W = N.times.map{gets.to_i}

def check(p)
  i = 0

  K.times do
    s = 0
    while s + W[i] <= p
      s += W[i]
      i += 1
      return N if i == N
    end
  end
  return i
end

def solve()
  left = 0
  right = 100000 * 10000

  while right - left > 1
    mid = (left + right) / 2
    v = check(mid)
    if v >= N
      right = mid
    else
      left = mid
    end
  end
  return right
end
puts solve()
