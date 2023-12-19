defmodule RandomNumber do
  def generateNumber(0) do
  end

  def generateNumber(quantity) do
    IO.puts(Enum.random(1000..9999))
    generateNumber(quantity - 1)
  end
end

quantity = 300
RandomNumber.generateNumber(quantity)
