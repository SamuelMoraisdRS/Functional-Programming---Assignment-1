# Programação Funcional - Tarefa 1


## Instalação

* Clone o repositório em seu computador, isso pode ser feito com o comando:
  ```
  git clone https://github.com/SamuelMoraisdRS/Functional-Programming---Assignment-1.git 
  ```
* No diretório do projeto, instale as dependências necessárias com o comando:
  ```
  mixs deps.get
  ``` 
* Use o comando  ``iex -S mix`` para compilar o projeto e inicializar o ambiente iEx.

## Uso
O projeto implementa o módulo ``Tarefa_1`` contendo a função ``calculate``, que soluciona o problema 9 da avaliação. A função aceita como argumentos dois parâmetros do tipo **float implementado pela biblioteca Decimal.** Ou seja, as entradas da função devem ser desse tipo. Para criar um número deste tipo utilizando a biblioteca, você pode usar a função ``new`` do módulo ``Decimal``. Por exemplo:
  ```elixir
  iex(1)> Tarefa_1.calculate(Decimal.new(1,1,-1),Decimal.new(1,1,-20)) 
  ```
Para melhores detalhes da biblioteca, recomenda-se a leitura da [documentação oficial](https://hexdocs.pm/decimal/readme.html)
A função retornará o número com a precisão indicada no formato de string.
* O código do módulo está presente no arquivo [tarefa_1.ex](./lib/tarefa_1.ex).



