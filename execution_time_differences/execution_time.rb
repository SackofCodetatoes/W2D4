# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved
# my_min
# Given a list of integers find the smallest number in the list.
# 
# Example:
# 
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
# 
# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

# O(n^2)
def my_slow_min(list)
  min = nil
  list.each_with_index do |num1, i|
    list.each_with_index do |num2, j|
      next if i == j
      min = num2 if min.nil? || (num2 < num1) && num2 < min
    end
  end
  min
end

# O(n)
def my_not_as_slow_min(list)
  min = nil
  list.each do |num|
    min = num if min.nil? || num < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_not_as_slow_min(list)  # =>  -5


# O(n^2)
def largest_contiguous_subsum(list)
  max = nil
  
  sub_arrays = []
  (0...list.length - 1).each do |i|
    (i...list.length).each do |j|
      sub_arrays << list[i..j]
    end
  end
  
  sub_arrays.each do |sub_array|
    sub_value = sub_array.reduce(:+)
    max = sub_value if max.nil? || max < sub_value
  end
  
  max
end

# list = [2, 3, -6, 7, -6, 7]
# puts largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

