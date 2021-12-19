defmodule ReportsGenerator do
  def build(filename) do
    # Uma forma de retornamos apenas o valor, seja do resultado se a operação for
    # bem sucedida, ou a mensagem do error.
    case File.read("reports/#{filename}") do
      {:ok, result } -> result
      {:error, reason } -> reason
      _ -> "caso nem dê sucesso, nem dê erro, vai cair aqui"
    end
  end
end
