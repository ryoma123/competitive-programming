N = gets.to_i
a = gets.split.map(&:to_i)

VMAX = 10000
S = a.min

def solve(a)
  ans = 0
  b = Marshal.load(Marshal.dump(a)).sort
  v = Array.new(N, false)
  t = []

  (0...N).each do |i|
    t[b[i]] = i
  end

  (0...N).each do |i|
    next if v[i]

    cur = i
    s = 0
    m = VMAX
    an = 0

    loop do
      v[cur] = true
      an += 1
      val = a[cur]
      m = [m, val].min
      s += val
      cur = t[val]

      break if v[cur]
    end
    ans += [s + (an - 2) * m, m + s + (an + 1) * S].min
  end
  ans
end

puts solve(a)
