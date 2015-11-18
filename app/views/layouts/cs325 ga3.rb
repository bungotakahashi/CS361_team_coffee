A = [31,41,59,26,53,58,6,97,93,23]
temp= Array.new
best=0
start=-1
last=-1
for i in 0..(A.length) 
   temp.push(A[i])
   temp2=temp
   for j in i..(A.length)
   	  temp2.push(A[j])
      if (temp.inject(:+))*temp.min <= (temp2.inject(:+))*temp2.min
      	temp=temp2
      	last=j
      end
  end
  if best<=temp
     best=temp
     start=i
  end
  temp.clear
end

puts best
puts start
puts last

