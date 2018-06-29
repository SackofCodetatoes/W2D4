
# O(n!)
def first_anagram?(first, second)
  anagrams = first.chars.permutation.to_a
  second_chars = second.chars
  anagrams.each do |ana|
    return true if second_chars == ana
  end
  
  false
end

p first_anagram?("gizmo", "sally") #false
p first_anagram?("elvis", "lives") #true


# O(n^2) maybe? or O(n)
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


# O(n^2)
def third_anagram?(first, second)
  first.chars.sort == second.chars.sort
end

p third_anagram?("gizmo", "sally") #false
p third_anagram?("elvis", "lives") #true


# O(n)
def fourth_anagram?(first, second)
  return false if first.length != second.length
  
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)
  
  first.each_char { |ch| first_hash[ch] += 1 }
  second.each_char { |ch| second_hash[ch] += 1 }
  
  first_hash.each do |k, v|
    return false if second_hash[k] != v
  end
  
  true
end


p fourth_anagram?("gizmo", "sally") #false
p fourth_anagram?("elvis", "lives") #true

puts "\n\n\n"

ana1 = "gkdlewjtkkgoelwnfuutreupwnfakwnfujdkafjkewonvkwqpqnekeolcvndsjkflejwkfjkdljklnvjeiwnfkwkdbwgwjdklfrhebdfkfkwbwndkdjegensksjbfsksgdb"
ana2 = "kntlekdendkktrejebskwsdukkwfvcwdbllefkkjgnffwofjnkqnofowalakkggjdevkbnndsflkwsegvkjupglkfeldjjwfnjfdbwiwwwbqpkrjfdekhskeudjnwwkeunj" 
ana3 = "kntlekdendkktrejebskwsdukkwfvcwdbllefkkjgnffwofjnkqnofowalakkggjdevkbnndsflkwsegvkjupglkfeldjjwfnjfdbwiwwwbqpkrjfdekhskeudjnwwkeunj" 
ana4 = "kntlekdendkktrejebsqwsdukkwfvcwdbllefkkjgnffwofjnkqnofowalakkggjdevkbnndsflkwsegvkjupglkfeldjjwfnjfdbwiwwwbqpkrjfdekhskeudjnwwkeunj"


p first_anagram?(ana1, ana2)
p second_anagram?(ana1, ana2)
p third_anagram?(ana1, ana2)
p fourth_anagram?(ana1, ana2)

p first_anagram?(ana3, ana4)
p second_anagram?(ana3, ana4)
p third_anagram?(ana3, ana4)
p fourth_anagram?(ana3, ana4)

