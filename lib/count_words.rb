def count_words(string)
    if string.empty? != true
        no_of_words = string.split(/[\s\W]/).size
        return "#{no_of_words} words"
    else
        fail "Error - no string given"
    end
end