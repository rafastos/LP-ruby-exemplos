# Lambda básica
soma = ->(x, y) { x + y }
puts soma.call(5, 3)  # Imprime: 8
puts soma[5, 3]       # Sintaxe alternativa

# Lambda com sintaxe alternativa (->)
multiplicar = ->(x, y) { x * y }
puts multiplicar.call(4, 3) # Imprime: 12

# Lambda que não aceita número errado de argumentos
cumprimentar = ->(nome) { "Olá, #{nome}!" }
puts cumprimentar.call('João') # Funciona
# cumprimentar.call  # Erro: argumentos errados

# Lambda com múltiplas linhas
processar = lambda do |numero|
  dobro = numero * 2
  triplo = numero * 3
  [dobro, triplo]
end

resultado = processar.call(5)
puts resultado.inspect # Imprime: [10, 15]

# Lambda como argumento de método
numeros = [1, 2, 3, 4, 5]
dobrar = ->(x) { x * 2 }
p numeros.map(&dobrar) # Imprime: [2, 4, 6, 8, 10]

# Lambda que captura variáveis do escopo
multiplicador = 3
multiplicar_por = ->(numero) { numero * multiplicador }
puts multiplicar_por.call(5) # Imprime: 15

# Lambda com argumentos padrão
saudacao = ->(nome = 'Visitante') { "Bem-vindo, #{nome}!" }
puts saudacao.call         # Imprime: Bem-vindo, Visitante!
puts saudacao.call('Bia')  # Imprime: Bem-vindo, Bia!

# Lambda como closure
def criar_contador
  contador = 0
  -> { contador += 1 }
end

contador = criar_contador
puts contador.call  # Imprime: 1
puts contador.call  # Imprime: 2
puts contador.call  # Imprime: 3
