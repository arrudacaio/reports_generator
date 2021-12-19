defmodule ReportsGenerator do
  alias ReportsGenerator.Parser


  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})


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

end
