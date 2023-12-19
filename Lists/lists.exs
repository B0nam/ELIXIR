defmodule Lists do
  def soma_lista(lista) do
    soma_lista(lista, 0)
  end

  defp soma_lista([], acc), do: acc
  defp soma_lista([head | tail], acc) do
    soma_lista(tail, acc + head)
  end
end

lista_numeros = [1, 2, 3, 4, 5]
soma = Lists.soma_lista(lista_numeros)
IO.puts("A soma dos elementos da lista é: #{soma}")
