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
  defp power(0,_) do
    0
  end
  defp power(_,0) do
    1
  end
  defp power(x, e) do
    Decimal.mult(x, power(x,e-1))
  end

  #Calcula cada termo do somatório
  defp calculateTerm(x,0) do
    x
  end
  defp calculateTerm(x, idx) do
    exp = (idx*2) + 1
    # Pode ser otimizado {
    listEven = 2..(exp - 1)//2
    listOdds = 1..(exp-1)//2
    numerator = Enum.reduce(listOdds, 1, fn (x,y) -> x * y end)
    denominator = Enum.reduce(listEven, 1, fn (x,y) -> x * y end)
    # }
    a = Decimal.div(numerator, denominator)
    Decimal.mult(a, Decimal.div(power(x,exp),exp))
  end

  # Função correspondente ao somatório
  defp calculateArcSin(x,epsilon, idx, sum) do
    a = calculateTerm(x, idx)
    s = Decimal.add(a, sum)
    if Decimal.lt?((Decimal.sub(s,sum)),epsilon) do
      # Decimal.to_string(s)
      s
    else
    calculateArcSin(x, epsilon, idx + 1, s)
  end
  end

  def calculate(x, epsilon) do
    Decimal.Context.set(%Decimal.Context{Decimal.Context.get() | precision: 6000})
    if Decimal.lt?((Decimal.sub(x,x)),epsilon) do
      x
    end
    calculateArcSin(x, epsilon, 1, x)
  end
end
