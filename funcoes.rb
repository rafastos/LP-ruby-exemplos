# Função básica
def saudacao(nome)
  puts "Olá, #{nome}!"
end

# Chamando a função
saudacao('Maria') # Imprime: Olá, Maria!

# Função com valor padrão
def soma(a, b = 0)
  a + b
end

puts soma(5, 3) # Imprime: 8
puts soma(5)    # Imprime: 5 (usa o valor padrão de b)

# Função com retorno múltiplo
def calcula_operacoes(x, y)
  soma = x + y
  subtracao = x - y
  [soma, subtracao]
end

resultado1, resultado2 = calcula_operacoes(10, 5)
puts resultado1  # Imprime: 15
puts resultado2  # Imprime: 5

# Função com bloco
def repetir_tres_vezes(&block)
  3.times(&block)
end

repetir_tres_vezes do |numero|
  puts "Repetição #{numero + 1}"
end

# Ruby implicitamente retorna a última linha de código da função
def calcular_area(base, altura)
  base * altura / 2.0
end
