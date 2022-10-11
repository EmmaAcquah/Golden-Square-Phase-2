def factorial(n)
    product = 1
    p "at the start product is #{product}"
    while n > 0
      p "when loop starts n is #{n}"
      p "we multiply #{product} by #{n}"
      product *= n
      n -= 1
      p "we get #{product}"
      p "we subtract 1 to get #{n} "
    end
    product
  end

  puts factorial(5)