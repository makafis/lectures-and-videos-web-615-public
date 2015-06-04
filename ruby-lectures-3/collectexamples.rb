n = [1,2,3]


squares = []

n.each do |i|
  squares << i*i
end

n.collect do |i|
  i*i #1,4,9
end #=> [1,4,9]


n.collect do |i|
  i*i #1,4,9
  8 # 8
end #=> [8,8,8]


n.collect do |i|
  i*i #=> nil #=> 1,4,9
end 
# 1
# 4
# 9
#=> [nil,nil,nil]


