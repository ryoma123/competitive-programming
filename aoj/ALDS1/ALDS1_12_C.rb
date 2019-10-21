N = gets.to_i
@a = N.times.map{gets.split.map(&:to_i)}

INFTY = 1<<21
WHITE = 0
GRAY  = 1
BLACK = 2

@adj = Array.new(N){[]}
@pq = []
@h = 0

def max_heapify(i)
  l = 2 * i
  r = 2 * i + 1

  if l <= @h && (@pq[l] <=> @pq[i]) == 1
    largest = l
  else
    largest = i
  end

  if r <= @h && (@pq[r] <=> @pq[largest]) == 1
    largest = r
  end

  if largest != i
    @pq[i], @pq[largest] = @pq[largest], @pq[i]
    max_heapify(largest)
  end
end

def extract
  return -INFTY if @h < 1
  maxv = @pq[1]

  @pq[1] = @pq[@h]
  @h -= 1

  max_heapify(1)
  maxv
end

def increase_key(i, key)
  return if (key <=> @pq[i]) == -1

  @pq[i] = key
  while i > 1 && (@pq[i / 2] <=> @pq[i]) == -1
    @pq[i], @pq[i / 2] = @pq[i / 2], @pq[i]
    i = i / 2
  end
end

def insert(key)
  @h += 1
  @pq[@h] = -INFTY
  increase_key(@h, key)
end

def dijkstra
  insert([0, 0])

  d = Array.new(N){INFTY}
  d[0] = 0
  color = Array.new(N){WHITE}
  color[0] = GRAY

  loop do
    f = extract
    break if f == -INFTY

    u = f[1]
    color[u] = BLACK
    next if d[u] < f[0] * -1

    (0...@adj[u].size).each do |j|
      v = @adj[u][j][0]
      next if color[v] == BLACK

      if d[v] > d[u] + @adj[u][j][1]
        d[v] = d[u] + @adj[u][j][1]
        insert([d[v] * -1, v])

        color[v] = GRAY
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
    @adj[u] = [] if @adj[u].nil?
    @adj[u].push([v, c])
  end
end
dijkstra
