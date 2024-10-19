# Polimorfismo por herança
class Animal
  def fazer_som
    'Som genérico de animal'
  end

  def mover
    'Movendo-se'
  end
end

class Cachorro < Animal
  def fazer_som
    'Au au!'
  end

  def mover
    'Correndo com 4 patas'
  end
end

class Gato < Animal
  def fazer_som
    'Miau'
  end

  def mover
    'Derrubando copos'
  end
end

# Usando polimorfismo
def interagir_com_animal(animal)
  puts animal.fazer_som
  puts animal.mover
end

cachorro = Cachorro.new
gato = Gato.new

interagir_com_animal(cachorro)  # Au au! / Correndo com 4 patas
interagir_com_animal(gato)      # Miau / Derrubando copos

# Polimorfismo por interface (duck typing)
class Carro
  def mover
    'Andando na estrada'
  end

  def fazer_som
    'Vrum vrum!'
  end
end

# Mesmo não herdando de Animal, funciona por ter os mesmos métodos
interagir_com_animal(Carro.new) # Vrum vrum! / Andando na estrada

# Simulando sobrecarga com número variável de argumentos
class Calculadora
  def somar(*numeros)
    numeros.sum
  end

  def multiplicar(*numeros)
    numeros.reduce(1, :*)
  end
end

calc = Calculadora.new
puts calc.somar(1, 2)        # 3
puts calc.somar(1, 2, 3, 4)  # 10
puts calc.multiplicar(2, 3) # 6
puts calc.multiplicar(2, 3, 4) # 24

# Simulando sobrecarga com argumentos opcionais
class Pessoa
  def inicializar(nome, idade = nil, cidade = nil)
    @nome = nome
    @idade = idade
    @cidade = cidade
  end

  def descricao
    info = "Nome: #{@nome}"
    info += ", Idade: #{@idade}" if @idade
    info += ", Cidade: #{@cidade}" if @cidade
    info
  end
end

# Simulando sobrecarga com argumentos nomeados
class Produto
  attr_reader :nome, :preco, :quantidade

  def initialize(**args)
    @nome = args[:nome]
    @preco = args[:preco] || 0
    @quantidade = args[:quantidade] || 1
  end

  def valor_total
    preco * quantidade
  end

  def imprime
    puts "Nome: #{@nome}, preço: #{@preco}, quantidade: #{@quantidade}"
  end
end

# Diferentes formas de criar produtos
p1 = Produto.new(nome: 'Lápis', preco: 2.50)
p2 = Produto.new(nome: 'Caneta', preco: 3.00, quantidade: 5)

p1.imprime
p2.imprime

# Polimorfismo com módulos
module Voador
  def voar
    "Voando como um #{self.class}"
  end
end

module Nadador
  def nadar
    "Nadando como um #{self.class}"
  end
end

class Ave
  include Voador
end

class Pinguim < Ave
  include Nadador

  def voar
    'Pinguins não voam!'
  end
end

class Aviao
  include Voador
end

# Todos podem voar, mas de formas diferentes
[Ave.new, Pinguim.new, Aviao.new].each do |objeto|
  puts objeto.voar
end

# Exemplo de polimorfismo com blocos
class Lista
  def initialize
    @items = []
  end

  def adicionar(item)
    @items << item
  end

  def processar(&block)
    if block_given?
      @items.each(&block)
    else
      @items.each { |item| puts item }
    end
  end
end

lista = Lista.new
lista.adicionar('Item 1')
lista.adicionar('Item 2')

# Sem bloco
lista.processar

# Com bloco personalizado
lista.processar { |item| puts "Processando: #{item}" }

# Polimorfismo com método method_missing
class ComportamentoDinamico
  def method_missing(nome_metodo, *args)
    if nome_metodo.to_s.start_with?('calcular_')
      "Calculando #{nome_metodo.to_s.sub('calcular_', '')}"
    else
      super
    end
  end

  def respond_to_missing?(nome_metodo, include_private = false)
    nome_metodo.to_s.start_with?('calcular_') || super
  end
end

obj = ComportamentoDinamico.new
puts obj.calcular_area    # "Calculando area"
puts obj.calcular_volume  # "Calculando volume"
