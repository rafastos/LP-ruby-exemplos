# Variáveis ​​e tipos de dados básicos
nome = "Alice"
idade = 30
altura = 1.75
eh_Estudante = true

# Interpolação de strings
puts "#{nome} tem #{idade} anos"

# Arrays
frutas = ["maçã", "banana", "cereja"]
puts frutas[1]  # Saída: banana

# Hashes
pessoa = { "nome" => "Bia", "idade" => 25 }
puts pessoa["nome"]  # Saída: Bia

# Symbols
status = :ativo
puts status.to_s  # Saída: ativo

# Aritmética básica
soma = 10 + 5
subtracao = 20 - 8
produto = 4 * 3
quociente = 15 / 3
puts "Soma: #{soma}, Subtração: #{subtracao}, Produto: #{produto}, Quociente: #{quociente}"

# Operadores de comparação
puts 5 > 3   # Saída: true
puts 10 == 10  # Saída: true
puts 7 <= 5   # Saída: false