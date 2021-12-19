defmodule ReportsGenerator do
  # def build(filename) do
  #   # Uma forma de retornamos apenas o valor, seja do resultado se a operação for
  #   # bem sucedida, ou a mensagem do error.
  #   case File.read("reports/#{filename}") do
  #     {:ok, result } -> result
  #     {:error, reason } -> reason
  #     _ -> "caso nem dê sucesso, nem dê erro, vai cair aqui"
  #   end
  # end

    ## Vamos criar uma função privada para fazermos o pattern matching
  # 1) Se der tudo certo, retorna o file_content
  # 2) Se der errado, retorna uma mensagem de erro
  # defp handle_file({:ok, file_content}), do: file_content
  # defp handle_file({:error, _reason}), do: "Error while open file!"

  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.map(fn line -> parse_line(line) end)
  end


  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
    |> IO.inspect()
  end


end
