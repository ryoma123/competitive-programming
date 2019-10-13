N = gets.to_i
a = N.times.map{gets.split.map(&:to_i)}

INFTY = 1<<21
n = 100

@m = Array.new(n){Array.new(n){0}}
@d = Array.new(N){INFTY}

def bfs(s)
  q = []
  q.push(s)

  @d[s] = 0

  while !q.empty?
    u = q.shift

    (0...N).each do |v|
      next if @m[u][v] == 0
      next if @d[v] != INFTY

      @d[v] = @d[u] + 1
      q.push(v)
    end
  end

  (0...N).each do |i|
    puts "#{i + 1} #{@d[i] == INFTY ? -1 : @d[i]}"
  end
end

(0...N).each do |i|
  u, k = a[i][0], a[i][1]
  u -= 1

  (0...k).each do |j|
    v = a[i][j + 2]
    v -= 1

    @m[u][v] = 1
  end
end
bfs(0)
