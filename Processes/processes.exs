defmodule Processes do
  def main do
    pid1 = spawn(fn -> receive_message() end)
    pid2 = spawn(fn -> send_message(pid1) end)
  end

  defp send_message(pid) do
    send(pid, {:message, "Olá, Processo 1!"})
  end

  defp receive_message do
    receive do
      {:message, msg} ->
        IO.puts("Processo 1 recebeu a mensagem #{msg}")
      end
    end
end

Processes.main()
