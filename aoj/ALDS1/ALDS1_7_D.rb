N = gets.to_i
$pre, $in = 2.times.map{gets.split.map(&:to_i)}

$post = []

def rec(l, r)
  return if l >= r
  return if $pos == N

  root = $pre[$pos]
  $pos += 1
  m = $in.index(root)

  rec(l, m)
  rec(m + 1, r)
  $post.push(root)
end

def solve
  $pos = 0
  rec(0, $pre.size)
end

puts solve.join(' ')
