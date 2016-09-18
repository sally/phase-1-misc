# a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4]

# base case: an empty array is already flattened
# recursive case: (recurse thru levels)
  # iterate through array, for each element
    # if it's an array, then concat the element
    # if it's not, then run the program again on the array

def rflatten(ary, result=[])
  ary.each do |elt|
    if !elt.kind_of?(Array)
      result << elt
    else
      rflatten(elt, result)
    end
  end

  result
end

p rflatten([1])
#=> [1]
p rflatten([[[[[1]]]]])
#=> [1]
p rflatten([])
#=> []
p rflatten([[1,2],[3,4]])
#=> [1, 2, 3, 4]
p rflatten([[1, [8, 9]], [3, 4]])
#=> [1, 8, 9, 3, 4]