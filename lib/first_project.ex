defmodule FirstProject do
  @moduledoc """
  Documentation for `FirstProject`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FirstProject.hello()
      :world

  """


  # Função exponenciação
  def power(0,_) do
    0
  end
  def power(_,0) do
    1
  end
  def power(x, e) do
    Decimal.mult(x, power(x,e-1))
  end

  #Calcula cada termo do somatório
  defp calculateTerm(x, 0, _) do  #Caso base
    x
  end
  defp calculateTerm(x, idx, prev) do
    # exp = (idx*2) + 1
    # # Pode ser otimizado {
    # listEven = 2..(exp - 1)//2
    # listOdds = 1..(exp-1)//2
    # numerator = listOdds |> Enum.reduce( 1, fn (x,y) -> x * y end)
    # denominator = listEven |> Enum.reduce( 1, fn (x,y) -> x * y end)
    # # }
    # a = Decimal.div(numerator, denominator)
    # x |> power(exp) |> Decimal.div(exp) |> Decimal.mult(a)
    exp = (2*idx) + 1
    IO.puts("exp:")
    IO.puts(exp)
    IO.puts("exp-1")
    IO.puts(exp-1)
    IO.puts("exp-2")
    IO.puts(exp-2)

    a = Decimal.mult(Decimal.div(Decimal.mult(power(x,2), exp - 2),exp),Decimal.div(exp - 2, exp - 1))
    IO.puts("Novo termo")
    IO.puts(Decimal.mult(prev,a))
    Decimal.mult(prev,a) # Retorno
  end

  # Função correspondente ao somatório
  defp calculateArcSin(x,epsilon, idx, sum, prev) do
    newTerm = calculateTerm(x, idx, prev)
    IO.puts("Novo termo do somatorio:")
    IO.puts(newTerm)
    IO.puts("epsilon")
    IO.puts(epsilon)
    newSum = Decimal.add(newTerm, sum)
    # Checa a condição de parada
    if Decimal.lt?(newTerm, epsilon) do  # se < epsilon
      Decimal.to_string(newSum)
      # s
    else
    calculateArcSin(x, epsilon, idx + 1, newSum,newTerm)
  end
  end

  def calculate(x, epsilon) do
    # Configuração da biblioteca de precisão infinita
    Decimal.Context.set(%Decimal.Context{Decimal.Context.get() | precision: 2000})
    # x = Decimal.from_float(x)
    # epsilon = Decimal.from_float(epsilon)
    # if Decimal.lt?((Decimal.sub(x,x)),epsilon) do
    #   x
    # end
    calculateArcSin(x, epsilon, 0, 0, 0)
  end
end
