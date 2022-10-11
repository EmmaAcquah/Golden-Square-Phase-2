  def encode(plaintext, key)
    #p "at the start of the program key = #{key} and plaintext = #{plaintext}"
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars) #calling, chars, a string method on an array 
    #p "the key is converted to cipher = #{cipher}" #what are the forward slashes in each character string? - new lines?
    
    ciphertext_chars = plaintext.chars.map do |char|
        #p "at the start of the iteration ciphertext_chars = #{ciphertext_chars}" # program stops here with error message "`+': nil can't be coerced into Integer"
        #p "cipher.find_index(char)):" #want to see if / why it returns nil - tested in irb
        #p cipher.find_index(char)
        #p "char: #{char}"
        (65 + cipher.find_index(char)).chr
        #p "result of .chr: #{(65 + cipher.find_index(char)).chr} "
    end
    return ciphertext_chars.join
  end
  
  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    #p "cipher = #{cipher}" #returns the same cipher array as encode function
    plaintext_chars = ciphertext.chars.map do |char|
      #p "when the ciphertext char is #{char}"
      #p "its ASCII no is calculated by char.ord = #{char.ord}"
      #p "the decoded char is: #{cipher[65 - char.ord]}"
      
      #p "[65 - char.ord] = #{65 - char.ord}" #results in a negative number - error
      
      cipher[char.ord - 65] #changed subtraction around to correct negative number error
    end
    return plaintext_chars.join
  end
  
  puts encode("test string", "secret key")
  puts decode("EBAEFAEDOSM", "secret key")


  # Intended output:
  #
  # > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  # > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  # => "theswiftfoxjumpedoverthelazydog"

  #takes plaintext and key as strings
  # cipher variable
  #at the start of the program: splits key into an array of chars
  #removes all but the first duplicate chars from the key array but keeps spaces
  #adds the key array (excl. duplicate chars) to the beginning of an a - z array less the lower case chars from the secret key (at the begining)
  #letter 'z' is also missing because the range ('a'...'z') is exclusive instead of inclusive
  # doesn't take capital letters
  # iteration looks up the first letter of the plain text string > 't' if plaintext is "test string"
  # finds the index in the cipher array > 4 if plaintext is "test string"
  # 65 = where A-Z capital letters start on an ASCII chart
  # adds the index number to 65 and returns letter at the sum position > "E" if plaintext is "test string"
  # .chr returns only the first char of a string (iteration for each letter)
  # vs .chars which creates an array of all the letters in a string
  # .map collects the shifted ASCII chars into a new array that is saved to ciphertext_chars
  # the array of chars is joined into a string and returned
  #encode and decode ciphers are the same - both missing 'z' - exclusive range
  #decode takes the cipher text and same key
  #iterates over ciphertext so each letter is looked up in the cipher array
  # char.ord returns the ASCII number of each char from the cipher text
  # the cipher text chars ASCII no. is subtracted from 65
  # results in a negative number because the subtraction is the wrong way around
  # negative index number looks up what should be the decoded char from the end of the cipher array
  # resolve by changing the cipher index number to subtract 65 from char.ord instead