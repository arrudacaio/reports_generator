## File.stream!()
Funçao que possui característica lazy, portanto é uma função preguiçosa que só vai
trazer todo conteúdo lido quando quisermos usar de fato. portanto o comum é ver a função 
retornar um enum, trazendo apenas metadados: 

``` elixir
%File.Stream{
  line_or_bytes: :line,
  modes: [:raw, :read_ahead, :binary],
  path: "reports/report_test.csv",
  raw: true
}
```
E por que existe uma exclamação após o nome da função? Pois diferente de outras funções, essa não retorna tuplas de :ok ou :error.

* refs: https://hexdocs.pm/elixir/1.12/Stream.html

</br>
</br>

## Função Anonima utilizando & 

Em elixir podemos criar uma função anônima utilizando o identificador &.

```elixir
  def buildSomeThing(file) do
    file
    |> Enum.map(&parse_line(&1))
  end

``` 
o &1 serve para capturarmos o primeiro parametro da função, nesse caso, file. 