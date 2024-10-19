# while - executa enquanto a condição for verdadeira
contador = 0
while contador < 5
  puts "Contagem: #{contador}"
  contador += 1
end

# until - executa até que a condição seja verdadeira
numero = 0
until numero == 5
  puts "Número: #{numero}"
  numero += 1
end

# for com range
for i in 0..4 # inclui o 4
  puts "Iteração: #{i}"
end

for i in 0...4 # exclui o 4
  puts "Iteração: #{i}"
end

# each - método mais comum para iteração
[1, 2, 3, 4, 5].each do |numero|
  puts "Número: #{numero}"
end

# each com hash
pessoa = { nome: 'João', idade: 30, cidade: 'São Paulo' }
pessoa.each do |chave, valor|
  puts "#{chave}: #{valor}"
end

# times - repete um número específico de vezes
5.times do |i|
  puts "Repetição #{i + 1}"
end

# upto - conta do número atual até o especificado
1.upto(5) do |n|
  puts "Contando até 5: #{n}"
end

# downto - conta do número atual até o especificado, decrementando
5.downto(1) do |n|
  puts "Contagem regressiva: #{n}"
end

# step - itera com um intervalo específico
(0..10).step(2) do |n|
  puts "Números pares: #{n}"
end

# loop - loop infinito (precisa de break)
loop do
  puts "Digite 'sair' para encerrar"
  entrada = gets.chomp
  break if entrada == 'sair'
end

# break, next e redo
10.times do |i|
  next if i == 3  # pula quando i é 3
  break if i == 8 # sai do loop quando i é 8

  puts "Valor: #{i}"
end

# each_with_index - acesso ao índice
%w[a b c].each_with_index do |letra, index|
  puts "#{index}: #{letra}"
end

# map/collect - cria um novo array com os resultados
numeros = [1, 2, 3, 4, 5]
dobrados = numeros.map do |n|
  n * 2
end
puts dobrados.inspect # [2, 4, 6, 8, 10]

# while com modificador de linha
contador = 0
puts "#{contador += 1}" while contador < 5

# select/find_all - filtra elementos
numeros = [1, 2, 3, 4, 5, 6]
pares = numeros.select do |n|
  n.even?
end
puts pares.inspect # [2, 4, 6]

# reject - o oposto do select
impares = numeros.reject do |n|
  n.even?
end
puts impares.inspect # [1, 3, 5]

# reduce/inject - acumula valores
soma = [1, 2, 3, 4, 5].reduce(0) do |acumulador, n|
  acumulador + n
end
puts soma # 15

# each_slice - itera em grupos
(1..6).each_slice(2) do |grupo|
  puts grupo.inspect
end
# [1, 2]
# [3, 4]
# [5, 6]
