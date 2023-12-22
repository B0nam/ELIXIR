defmodule Ring do

  def start_ring(size) do
    # Cria os processos.
    process_list = create_processes(size);

    # Define as posições do processo no ring e define o próximo elemento de cada processo.
    ring = setPositions(process_list);

    # Envia a primeira mensagem que desencadeia o loop()
    firstProcess = Enum.at(ring, 0)
    send(firstProcess.pid, {:message, ring, -1})
    IO.puts("[+] Primeira mensagem enviada.")
  end

  def create_processes(size) do
    1..size |> Enum.map(fn _ -> spawn(fn -> loop() end) end)
  end

  def setPositions(process_list) do
    Enum.with_index(process_list)
      |> Enum.map(fn {process, position} ->
        next_process = Enum.at(process_list, position + 1)
        if next_process do
          %{pid: process, position: position, next_process: next_process}
        else
          %{pid: process, position: position, next_process: Enum.at(process_list, 0)}
        end
      end)
  end

  def loop() do
    receive do
      {:message, ring, position} ->
        :timer.sleep(1000) # 1 segundo a cada mensagem

        actual_process_position =
          if (position + 1) == (Enum.count(ring)) do
            IO.puts("\n[+] NOVO CICLO INICIADO.\n")
            0
          else
            position + 1
          end

        next_process_pid = Enum.at(ring, actual_process_position).next_process

        IO.puts("#{actual_process_position} RECEIVED FROM #{position}")
        send(next_process_pid, {:message, ring, actual_process_position})

        loop()
    end
  end
end
