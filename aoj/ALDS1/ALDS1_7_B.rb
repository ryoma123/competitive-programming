N = gets.to_i
a = N.times.map{gets.split.map(&:to_i)}

NONE = -1
root = 0
$t = {}
$d = []
$h = []

def set_depth(u, d)
  return if u == NONE
  $d[u] = d
  set_depth($t[u][:l], d + 1)
  set_depth($t[u][:r], d + 1)
end

def set_height(u)
  h1, h2 = 0, 0
  h1 = set_height($t[u][:l]) + 1 unless $t[u][:l] == NONE
  h2 = set_height($t[u][:r]) + 1 unless $t[u][:r] == NONE
  $h[u] = (h1 > h2) ? h1 : h2
end

def get_sibling(u)
  return NONE if $t[u][:p] == NONE
  return $t[$t[u][:p]][:l] if $t[$t[u][:p]][:l] != u && !$t[$t[u][:p]][:l] != NONE
  return $t[$t[u][:p]][:r] if $t[$t[u][:p]][:r] != u && !$t[$t[u][:p]][:r] != NONE
  NONE
end

def type(u)
  if $t[u][:p] == NONE
    'root'
  elsif $t[u][:l] == NONE && $t[u][:r] == NONE
    'leaf'
  else
    'internal node'
  end
end

def degree(u)
  deg = 0
  deg += 1 unless $t[u][:l] == NONE
  deg += 1 unless $t[u][:r] == NONE
  deg
end

def print()
  (0...N).each do |u|
    puts "node #{u}: parent = #{$t[u][:p]}, sibling = #{get_sibling(u)}, degree = #{degree(u)}, depth = #{$d[u]}, height = #{$h[u]}, #{type(u)}"
  end
end

(0...N).each do |i|
  $t[i] = {p: NONE, l: NONE, r: NONE}
end

a.each do |a|
  v, l, r = a

  $t[v][:l] = l
  $t[v][:r] = r
  $t[l][:p] = v unless l == NONE
  $t[r][:p] = v unless r == NONE
end

(0...N).each do |i|
  root = i if $t[i][:p] == NONE
end

set_depth(root, 0)
set_height(root)
print()
