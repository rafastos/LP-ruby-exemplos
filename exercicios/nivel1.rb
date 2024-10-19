# Você recebe o número de alunos e o número de páginas, retorne quantas páginas serão necessárias.
# Se qualquer for negativo retorne 0.

def paperwork(n, m)
  n >= 0 && m >= 0 ? n * m : 0
end

puts paperwork(5, 5)
puts paperwork(5, -5)
puts paperwork(-5, -5)
puts paperwork(-5, 5)
puts paperwork(5, 0)

# Escreva uma função chamada que recebe dois parâmetros.
# O primeiro parâmetro, employed, é verdadeiro sempre que você estiver empregado.
# O segundo parâmetro, vacation, é verdadeiro sempre que você estiver de férias.
# A função deve retornar verdadeiro se você estiver empregado e não estiver de férias
# (porque essas são as circunstâncias sob as quais você precisa definir um alarme).
# Caso contrário, deverá retornar falso.

def set_alarm(employed, vacation)
  employed && !vacation
end

puts set_alarm(true, true)
puts set_alarm(false, true)
puts set_alarm(false, false)
puts set_alarm(true, false)

# Escreva uma função que remova os espaços da string e retorne a string resultante.
def no_space(str)
  str.delete(' ')
end

puts no_space('8 j 8   mBliB8g  imjB8B8  jl  B')
puts no_space('8 8 Bi fk8h B 8 BB8B B B  B888 c hl8 BhB fd')
puts no_space('8aaaaa dddd r     ')
puts no_space('jfBm  gk lf8hg  88lbe8 ')
puts no_space('8j aam')

# Você recebe o comprimento e a largura de um polígono de 4 lados. O polígono pode ser um retângulo ou um quadrado.
# Se for um quadrado, retorne sua área. Se for um retângulo, retorne seu perímetro.

def area_or_perimeter(l, w)
  l == w ? l * w : 2 * (l + w)
end

# Escreva um programa que encontre a soma de todos os números de 1 a num.
# O número sempre será um número inteiro positivo maior que 0. Sua função só precisa retornar o resultado.

def summation(num)
  sum = 0
  1.upto(num) { |n| sum += n }
  sum
end

# Crie uma função que receba um número inteiro como argumento e retorne "Par" para números pares ou "Ímpar" para números ímpares.
def even_or_odd(number)
  number.even? ? 'Par' : 'Ímpar'
end
