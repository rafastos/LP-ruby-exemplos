# Proc básico
saudacao = proc { |nome| puts "Olá, #{nome}!" }
saudacao.call('Maria') # Imprime: Olá, Maria!
saudacao['João'] # Sintaxe alternativa
saudacao.call('Ana') # Outra sintaxe alternativa
saudacao.===('Carlos') # Mais uma sintaxe alternativa

# Proc com argumentos flexíveis (diferente de lambda)
soma = proc { |a, b| puts a + (b || 0) }
soma.call(5, 3)  # Imprime: 8
soma.call(5)     # Imprime: 5 (b será nil, então usa 0)
soma.call(5, 3, 2) # Ignora o argumento extra

# Convertendo método em Proc
def dobrar(x)
  x * 2
end
numeros = [1, 2, 3, 4, 5]
puts numeros.map(&method(:dobrar)) # Imprime: [2, 4, 6, 8, 10]

# Proc como closure
def criar_multiplicador(fator)
  proc { |numero| numero * fator }
end

multiplicar_por_dois = criar_multiplicador(2)
multiplicar_por_tres = criar_multiplicador(3)

puts multiplicar_por_dois.call(5)  # Imprime: 10
puts multiplicar_por_tres.call(5)  # Imprime: 15

# Proc com múltiplas linhas
processador = proc do |x|
  resultado = x * 2
  resultado += 1
  resultado
end

puts processador.call(5) # Imprime: 11

# Comportamento do return em Proc
def teste_proc
  proc = proc { return 'Retorno do Proc' }
  proc.call
  puts 'Essa linha não será executada'
end

puts teste_proc # Imprime: Retorno do Proc

# Proc com yield
def executar_proc(&bloco)
  puts 'Antes'
  bloco.call
  puts 'Depois'
end

executar_proc { puts 'Durante' }

# Proc como filtro
numeros = [1, 2, 3, 4, 5, 6]
par = proc { |num| num.even? }
puts numeros.select(&par) # Imprime: [2, 4, 6]

# Encadeando Procs
adicionar_um = proc { |n| n + 1 }
multiplicar_por_dois = proc { |n| n * 2 }
numeros = [1, 2, 3]
resultado = numeros.map(&adicionar_um).map(&multiplicar_por_dois)
puts resultado.inspect # Imprime: [4, 6, 8]

# Proc com argumentos padrão
cumprimentar = proc { |nome = 'Visitante'| puts "Bem-vindo, #{nome}!" }
cumprimentar.call        # Imprime: Bem-vindo, Visitante!
cumprimentar.call('Bia') # Imprime: Bem-vindo, Bia!
