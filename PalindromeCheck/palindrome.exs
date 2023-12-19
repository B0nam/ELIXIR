defmodule Palindrome do
  def palindromeCheck?(str) do
    str = String.downcase(str)
    str_reverse = String.reverse(str)
    str == str_reverse
  end
end

palavra = "Arara"
if Palindrome.palindromeCheck?(palavra) do
  IO.puts("#{palavra} é um palindromo.")
else
  IO.puts("#{palavra} não é um palindromo.")
end
