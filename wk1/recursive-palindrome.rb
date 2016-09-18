# a recursive function that returns true if a string is a palindrome and false otherwise

# base case: an empty string is a palindrome
# recursive case: check if the first and last characters of the string are equal
  # if they are, then run the program again on string with first and last chars removed
  # if not, then return false

def palindrome?(str)
  if str.empty?
    true
  else 
    return false if str[0] != str[-1]
    palindrome?(str[1..-2])
  end
end

p palindrome?("racecar")
#=> true
p palindrome?("")
#=> true
p palindrome?("not a palindrome")
#=> false
p palindrome?("abba")
#=> true