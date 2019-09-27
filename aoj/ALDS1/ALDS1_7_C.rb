N = gets.to_i
a = N.times.map{gets.split.map(&:to_i)}

NONE = -1
root = 0
$t = {}

def preParse(u)
  return if u == NONE
  print " #{u}"
  preParse($t[u][:l])
  preParse($t[u][:r])
end

def inParse(u)
  return if u == NONE
  inParse($t[u][:l])
  print " #{u}"
  inParse($t[u][:r])
end

def postParse(u)
  return if u == NONE
  postParse($t[u][:l])
  postParse($t[u][:r])
  print " #{u}"
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

puts 'Preorder'
preParse(root)
print "\n"
puts 'Inorder'
inParse(root)
print "\n"
puts 'Postorder'
postParse(root)
print "\n"
