# A ruby program to take in an array of elements and return the "power set" of the elements in the array

# input: An array of elements
# output: An array containing all possible sub-arrays of input array (order doesn't matter)

# base case: if the array is empty, then the only possible sub-array is an empty-array
# recursive case:
  # fix the 0th indexed element, and get all subsets including the 0th indexed element by the following:
    # base case: if the array is empty, return all the subsets
    # recursive case (for step n): iterate through the truncated array. for each element:
      # add a subset containing that element and the first n elements of the original array
      # run the program again on the truncated array

def power_set(ary, pset = [])
  if ary.empty?
    pset.flatten(1) + [[]]
  else
    pset << make_subsets_with_first_elt(ary)
    power_set(ary[1..-1],pset)
  end
end

def make_subsets_with_first_elt(ary, subsets=[[ary[0]]], included_elts = [ary[0]])
  if ary.empty?
    subsets
  else
    truncated_ary = ary[1..-1]
    truncated_ary.each do |elt|
      ary_to_add = included_elts.flatten + [elt]
      subsets << ary_to_add
    end

    included_elts << truncated_ary[0]

    make_subsets_with_first_elt(truncated_ary, subsets, included_elts)
  end
end

p make_subsets_with_first_elt([1,2,3])
#=> [[1], [1, 2], [1, 3], [1, 2, 3]]
p power_set([])
#=> []
p power_set([1])
#=> [[1], []]
p power_set([1,2])
#=> [[1], [1, 2], [2], []]
p power_set([1,2,3])
#=> [[1], [1, 2], [1, 3], [1, 2, 3], [2], [2, 3], [3], []]