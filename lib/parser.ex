defmodule ReportsGenerator.Parser do

  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end) ### O stream map está gerando cada linha após parsear, e só é gerado quando necessário, se ele tiver 400 mil linhas, ele vai gerando cada linha por demanda, sem carregar tudo em memória.

  end


  def parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
