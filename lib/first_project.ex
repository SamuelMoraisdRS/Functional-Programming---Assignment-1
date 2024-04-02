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


  # Power function using Decimal library's numbers
  defp power(0,_) do
    0
  end

  defp power(_,0) do
    1
  end

  defp power(x, e) do
    Decimal.mult(x, power(x,e-1))
  end

  defp calculateTerm(x,0) do
    x
  end

  defp calculateTerm(x, idx) do
    exp = (idx*2) + 1
    listEven = 2..(exp - 1)//2
    listOdds = 1..(exp-1)//2
    numerator = Enum.reduce(listOdds, 1, fn (x,y) -> x * y end)
    IO.puts("numerator:")
    IO.puts(numerator)
    denominator = Enum.reduce(listEven, 1, fn (x,y) -> x * y end)
    IO.puts("denominator")
    IO.puts(denominator)
    a = Decimal.div(numerator, denominator)
    IO.puts(Decimal.mult(a, Decimal.div(Decimal.mult(x,exp),exp)))
    Decimal.mult(a, Decimal.div(power(x,exp),exp))
  end

  # This version cannot be called by the client
  defp calculateArcSin(x,epsilon, idx, sum) do
    a = calculateTerm(x, idx)
    # IO.puts("Termo calculado")
    # IO.puts(a)
    s = Decimal.add(a, sum)
    # IO.puts("epsilon")
    # IO.puts(epsilon)
    # IO.puts("diff")
    # IO.puts(Decimal.sub(s,sum))
    # IO.puts(Result)
    # IO.puts(s)
    if Decimal.lt?((Decimal.sub(s,sum)),epsilon) do
      s
    else
    calculateArcSin(x, epsilon, idx + 1, s)
  end
  end
  def calculateArcSin(x, epsilon) do
    Decimal.Context.set(%Decimal.Context{Decimal.Context.get() | precision: 500})
    # curr_term = calculateTerm(x,0)
    # # Pode resultar em 2x
    # s = Decimal.add(x, curr_term)
    if Decimal.lt?((Decimal.sub(x,x)),epsilon) do
      x
    end
    calculateArcSin(x, epsilon, 1, x)
  end
end
