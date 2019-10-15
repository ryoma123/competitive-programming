N = gets.to_i

INFTY = 1<<21
WHITE = 0
GRAY  = 1
BLACK = 2

@m = N.times.map{gets.split.map{|i| i == '-1' ? INFTY : i.to_i }}

def prim
  d = Array.new(N){INFTY}
  p = Array.new(N){-1}
  color = Array.new(N){WHITE}

  d[0] = 0

  loop do
    minv = INFTY
    u = -1
    (0...N).each do |i|
      if minv > d[i] && color[i] != BLACK
        u = i
        minv = d[i]
      end
    end

    break if u == -1
    color[u] = BLACK

    (0...N).each do |v|
      if color[v] != BLACK && @m[u][v] != INFTY
        if d[v] > @m[u][v]
          d[v] = @m[u][v]
          p[v] = u
          color[v] = GRAY
        end
      end
    end
  end

  sum = 0

  (0...N).each do |i|
    sum += @m[i][p[i]] if p[i] != -1
  end

  return sum
end

puts prim
