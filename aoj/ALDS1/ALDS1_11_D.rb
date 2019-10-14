N, m = gets.split.map(&:to_i)

@g = []
(0...m).each do |i|
  s, t = gets.split.map(&:to_i)

  @g[s] = [] if @g[s].nil?
  @g[s].push(t)
  @g[t] = [] if @g[t].nil?
  @g[t].push(s)
end

q = gets.to_i
s, t = q.times.map{gets.split.map(&:to_i)}.transpose

NONE = -1
@color = Array.new(N){NONE}

def dfs(r, c)
  s = []
  s.push(r)
  @color[r] = c

  while !s.empty?
    u = s.shift
    next if @g[u].nil?

    (0...@g[u].size).each do |i|
      v = @g[u][i]

      if @color[v] == NONE
        @color[v] = c
        s.push(v)
      end
    end
  end
end

def assign_color
  id = 1

  (0...N).each do |u|
    dfs(u, id) if @color[u] == NONE
    id += 1
  end
end

assign_color

(0...q).each do |i|
  puts @color[s[i]] == @color[t[i]] ? 'yes' : 'no'
end
