# Complete a solução para que retorne verdadeiro se o primeiro argumento (string) passado terminar com o segundo argumento (também uma string).
def solution(str, ending)
  str.end_with?(ending)
end

# Se listarmos todos os números naturais abaixo de 10 que são múltiplos de 3 ou 5, obtemos 3, 5, 6 e 9. A soma desses múltiplos é 23.
# Finalize a solução para que retorne a soma de todos os múltiplos de 3 ou 5 abaixo do número passado.
# Além disso, se o número for negativo, retorne 0. Observação: se o número for múltiplo de 3 e 5, conte-o apenas uma vez.
def multiples(number)
  return 0 if number.negative?

  sum = 0
  (1...number).each do |n|
    sum += n if (n % 3).zero? || (n % 5).zero?
  end
  sum
end
