def f(n)
  ratings = Hash.new {0}
  n.each { |val| 
    ratings[val] += 1
  }
  niz = []
  ratings.keys.each { |rt| 
    if ratings[rt] >= n.length / 2
      niz.append(rt)
    end
  }
  return niz
end

puts f([1,4,4,4,2,3,8,4,3,4,4])
