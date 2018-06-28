def first_anagram?(first, second)
  anagrams = first.chars.permutation.to_a
  second_chars = second.chars
  anagrams.each do |ana|
    return true if second_chars == ana
  end
  
  false
end

# p first_anagram?("gizmo", "sally") #false
# p first_anagram?("elvis", "lives") #true
def second_anagram?(first, second)
  first.chars.each do |ch|
    if first.count(ch) == second.count(ch)
      first.delete!(ch)
      second.delete!(ch)
    else 
      return false 
    end
  end
  first == second
end

p second_anagram?("gizmo", "sally") #false
p second_anagram?("elvis", "lives") #true
