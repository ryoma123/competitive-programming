N = gets.to_i
a = N.times.map{gets.split.map(&:to_i)}

WHITE = 0
GRAY  = 1
BLACK = 2

@color = []
@d = []
@f = []
@tt = 0
@m = Array.new(N){Array.new(N){0}}

def dfs_visit(u)
  @color[u] = GRAY
  @d[u] = @tt += 1

  (0...N).each do |v|
    if @m[u][v] == 0
      next
    end

    if @color[v] == WHITE
      dfs_visit(v)
    end
  end

  @color[u] = BLACK
  @f[u] = @tt += 1
end

def dfs
  (0...N).each do |u|
    @color[u] = WHITE
  end

  (0...N).each do |u|
    if @color[u] == WHITE
      dfs_visit(u)
    end
  end

  (0...N).each do |u|
    puts "#{u + 1} #{@d[u]} #{@f[u]}"
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
dfs
