INFTY = 1<<21
WHITE = 0
GRAY  = 1
BLACK = 2

N = gets.to_i
@a = N.times.map{gets.split.map(&:to_i)}

@m = Array.new(N){Array.new(N){INFTY}}

def dijkstra
  d = Array.new(N){INFTY}
  color = Array.new(N){WHITE}

  d[0] = 0
  color[0] = GRAY

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
        if d[v] > d[u] + @m[u][v]
          d[v] = d[u] + @m[u][v]
          color[v] = GRAY
        end
      end
    end
  end

  (0...N).each do |i|
    puts "#{i} #{d[i] == INFTY ? -1 : d[i]}"
  end
end

(0...N).each do |i|
  u = @a[i][0]
  k = @a[i][1]

  (2...(k * 2 + 2)).each do |j|
    next if j.odd?
    v = @a[i][j]
    c = @a[i][j + 1]
    @m[u][v] = c
  end
end
dijkstra
