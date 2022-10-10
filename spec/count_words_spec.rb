require 'count_words'

RSpec.describe 'count_words method' do
    it 'returns the number of words in a string' do
        result = count_words("This is a string of words.")
        expect(result).to eq "6 words"
    end

    context 'if given an empty string' do
        it 'fails' do
            expect{ count_words("") }.to raise_error "Error - no string given"
        end
    end

    context 'if given a string with words separated by symbols' do
        it 'counts the number of words' do
        result = count_words("This!is@a£string#of$words%separated^by&symbols•")
        expect(result).to eq "9 words"
        end
    end
end

#User Story - Describe the problem
#A method called count_words that takes a string as an argument and returns the number of words in that string.

#Method Signature - what data types?
#Name: count_words
#Input (parameters): Takes text as a string
#Output (return values): Returns the number of words as an integer

#Example Tests
#test it counts the number of words correctly
#should fail if given an empty string

#Edge Cases?
#what about other delimiters that aren't spaces - symbols?