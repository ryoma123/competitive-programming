n = gets.to_i
arr = n.times.map{gets.split}

$root = {}
$none = {}

def tree_minimum(x)
  while x[:left] != $none
    x = x[:left]
  end
  x
end

def find(u, k)
  while u != $none && k != u[:key]
    if k < u[:key]
      u = u[:left]
    else
      u = u[:right]
    end
  end
  u
end

def tree_successor(x)
  if x[:right] != $none
    return tree_minimum(x[:right])
  end

  y = x[:parent]

  while y != $none && x == y[:right]
    x = y
    y = y[:parent]
  end
  y
end

def tree_delete(z)
  if z[:left] == $none || z[:right] == $none
    y = z
  else
    y = tree_successor(z)
  end

  if y[:left] != $none
    x = y[:left]
  else
    x = y[:right]
  end

  if x != $none
    x[:parent] = y[:parent]
  end

  if y[:parent] == $none
    $root = x
  else
    if y == y[:parent][:left]
      y[:parent][:left] = x
    else
      y[:parent][:right] = x
    end
  end

  if y != z
    z[:key] = y[:key]
  end
end

def insert(k)
  y = $none
  x = $root
  z = {}

  z[:key] = k
  z[:left] = $none
  z[:right] = $none

  while x != $none
    y = x
    if z[:key] < x[:key]
      x = x[:left]
    else
      x = x[:right]
    end
  end

  z[:parent] = y
  if y == $none
    $root = z
  else
    if z[:key] < y[:key]
      y[:left] = z
    else
      y[:right] = z
    end
  end
end

def inorder(u)
  return if u[:key].nil?
  inorder(u[:left])
  print " #{u[:key]}"
  inorder(u[:right])
end

def preorder(u)
  return if u[:key].nil?
  print " #{u[:key]}"
  preorder(u[:left])
  preorder(u[:right])
end

arr.each do |a|
  if a[0][0] == 'f'
    t = find($root, a[1].to_i)
    puts (t != $none) ? 'yes' : 'no'
  elsif a[0] == 'insert'
    insert(a[1].to_i)
  elsif a[0] == 'print'
    inorder($root)
    print "\n"
    preorder($root)
    print "\n"
  elsif a[0] == 'delete'
    tree_delete(find($root, a[1].to_i))
  end
end
