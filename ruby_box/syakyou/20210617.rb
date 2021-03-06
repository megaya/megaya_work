def is_loop(n)
  check = n * 3 + 1

  while check != 1 do
    check = check.even? ? check / 1 : check * 3 + 1
    return true if check == n
  end

  return false 
end

puts 2.step(10000, 2).count do |i|
  is_loop(i)
end
