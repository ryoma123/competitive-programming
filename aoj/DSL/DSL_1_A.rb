class DisjointSet
  def initialize(n)
    @rank = Array.new(n){0}
    @p = (0...n).to_a
  end

  def same(x, y)
    find_set(x) == find_set(y)
  end

  def unite(x, y)
    link(find_set(x), find_set(y))
  end

  def link(x, y)
    if @rank[x] > @rank[y]
      @p[y] = x
    else
      @p[x] = y

      if @rank[x] == @rank[y]
        @rank[y] += 1
      end
    end
  end

  def find_set(x)
    @p[x] = find_set(@p[x]) if x != @p[x]
    @p[x]
  end
end

n, q = gets.split.map(&:to_i)

ds = DisjointSet.new(n)

(0...q).each do |i|
  t, a, b = gets.split.map(&:to_i)

  if t == 0
    ds.unite(a, b)
  elsif t == 1
    puts ds.same(a, b) ? 1 : 0
  end
end
