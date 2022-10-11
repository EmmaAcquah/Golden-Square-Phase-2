def get_most_common_letter(text)
    counter = Hash.new(0)
    p "at the start counter variable = #{counter}"
    text.chars.each do |char|
        p " when char being iterated over is #{char}"
        p "... counter[char] = #{counter[char]}"
      counter[char] += 1
      p "counter[char] is incremented by 1: #{counter[char]}"
    end
    #p "at the end of iteration counter = #{counter}"
    #p "counter.to_a = #{counter.to_a}"
    p "counter.to_a.sort_by = #{counter.to_a.sort_by{ |k, v| v }}"
    counter.to_a.sort_by { |k, v| v }[-2][0]
  end
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"
puts get_most_common_letter("the roof, the roof, the roof is on fire!")  


# counter variable stores a new empty hash
#why zero as the arguement in Hash.new(0) ?
#text.chars takes the text string and splits it into an array of characters
#each char is iterated over to count the occurrence
#at the end of the iteration counter is a hash with the letter as the key and frequency/occurence as the value
#counter.to_a turns the letter/frequency hash into a 2D array with the letter and its frequency in each pair
#.sort_by - returns an enumerator? #<Enumerator:0x00000001358304d8>" - can't see because tried to print without the block
#.sort_by is sorting the letter frequency in ascending order (smallest to largest)
# which returns the least frequent letter/symbol when accessed using [0][0]
#i.e. the letter from the first key value pairing 
# if changed to look at the last/largest value in the sorted counter array it returns white space.
# need to filter out white space