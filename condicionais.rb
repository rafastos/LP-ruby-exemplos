# if básico
idade = 18
puts 'Maior de idade' if idade >= 18

# if/else
nota = 7
if nota >= 7
  puts 'Aprovado'
else
  puts 'Reprovado'
end

# if/elsif/else
nota = 5
if nota >= 7
  puts 'Aprovado'
elsif nota >= 5
  puts 'Recuperação'
else
  puts 'Reprovado'
end

# unless (executa se a condição for falsa)
chovendo = false
puts 'Vamos ao parque' unless chovendo

# Operador ternário
idade = 20
status = idade >= 18 ? 'Maior de idade' : 'Menor de idade'
puts status

# case/when (switch case)
dia = 'Segunda'
case dia
when 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'
  puts 'Dia útil'
when 'Sábado', 'Domingo'
  puts 'Fim de semana'
else
  puts 'Dia inválido'
end

# case com ranges
nota = 8
case nota
when 0..4
  puts 'Reprovado'
when 5..6
  puts 'Recuperação'
when 7..10
  puts 'Aprovado'
else
  puts 'Nota inválida'
end

# Modificador de linha (if/unless em uma linha)
temperatura = 10
previsao_sol = false
puts 'Está frio!' if temperatura < 15
puts 'Leve guarda-chuva' unless previsao_sol

# Operadores lógicos AND (&&) e OR (||)
idade = 25
tem_carteira = true
puts 'Pode dirigir' if idade >= 18 && tem_carteira

dinheiro = 100
cartao = true
puts 'Pode fazer a compra' if dinheiro >= 50 || cartao

# nil e false são os únicos valores falsos
valor = 0
puts '0 é considerado verdadeiro em Ruby!' if valor

# Estruturas de condição aninhadas
usuario_logado = true
admin = true
if usuario_logado
  if admin
    puts 'Acesso total ao sistema'
  else
    puts 'Acesso limitado ao sistema'
  end
else
  puts 'Faça login primeiro'
end

# Utilizando métodos predicate (terminam com ?)
numeros = [1, 2, 3]
if numeros.empty?
  puts 'Array vazio'
elsif numeros.include?(2)
  puts 'Contém o número 2'
end

# Usando o operador de navegação segura (&.)
usuario = nil
puts usuario&.nome || 'Usuário sem nome'
