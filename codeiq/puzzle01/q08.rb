N = 12

def move(a)
  return 1 if a.size == N + 1

  cnt = 0

  [[0, 1], [0, -1], [1, 0], [-1, 0]].each {|d|
    pos = [a[-1][0] + d[0], a[-1][1] + d[1]]

    if !a.include?(pos)
      cnt += move(a + [pos])
    end
  }
  cnt
end

puts move([[0, 0]])
