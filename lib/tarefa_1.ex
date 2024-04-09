defmodule Tarefa_1 do

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

  # Calcula cada termo do somatório
  defp calculateTerm(x, 0, _) do  # Caso base
    x
  end
  defp calculateTerm(x, idx, prev) do # Para idx > 0
    exp = (2*idx) + 1
    # expressão para cálculo do novo termo
    a = Decimal.mult(Decimal.div(Decimal.mult(power(x,2), exp - 2),exp),Decimal.from_float((exp - 2) / (exp - 1)))
    Decimal.mult(prev,a) # Retorno
  end

  # Função correspondente ao somatório
  def calculate(x,epsilon, idx \\ 0, sum \\ 0, prev \\ 0) do
    # Configuração da biblioteca Decimal
    Decimal.Context.set(%Decimal.Context{Decimal.Context.get() | precision: 800})
    newTerm = calculateTerm(x, idx, prev)
    newSum = Decimal.add(newTerm, sum)
    if Decimal.lt?(Decimal.sub(newSum,sum), epsilon) do  # se < epsilon
      Decimal.to_string(newSum)
    else
    calculate(x, epsilon, idx + 1, newSum,newTerm)
  end
  end
end
