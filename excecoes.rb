# Begin/Rescue básico
begin
  # Código que pode gerar erro
  resultado = 10 / 0
rescue
  puts "Ocorreu um erro!"
end

# Capturando exceções específicas
begin
  arquivo = File.open("arquivo_inexistente.txt")
rescue Errno::ENOENT
  puts "Arquivo não encontrado!"
rescue ZeroDivisionError
  puts "Divisão por zero!"
rescue => e  # Captura qualquer exceção e guarda na variável e
  puts "Erro: #{e.message}"
  puts "Backtrace: #{e.backtrace}"
end

# Usando ensure (finally)
begin
  arquivo = File.open("teste.txt", "w")
  arquivo.write("Teste")
rescue IOError => e
  puts "Erro de I/O: #{e.message}"
ensure
  arquivo.close if arquivo  # Sempre será executado
end

# Criando exceção personalizada
class MeuErroPersonalizado < StandardError
  attr_reader :codigo
  
  def initialize(mensagem = "Erro personalizado", codigo = 500)
    @codigo = codigo
    super(mensagem)
  end
end

# Usando exceção personalizada
begin
  raise MeuErroPersonalizado.new("Algo deu errado", 400)
rescue MeuErroPersonalizado => e
  puts "Erro #{e.codigo}: #{e.message}"
end

# Usando retry
tentativas = 0
begin
  raise "Erro" if tentativas < 3
  puts "Sucesso!"
rescue
  tentativas += 1
  puts "Tentativa #{tentativas}"
  retry if tentativas < 3
  puts "Desistindo após #{tentativas} tentativas"
end

# Usando else (executado se não houver exceções)
begin
  puts "Tentando algo..."
rescue
  puts "Erro!"
else
  puts "Nenhum erro ocorreu!"
ensure
  puts "Isso sempre será executado"
end

# Lançando exceções condicionalmente
def dividir(a, b)
  raise ArgumentError, "Divisor não pode ser zero" if b.zero?
  a / b
end

# Usando throw/catch para controle de fluxo
def processar_dados
  catch :cancelar do
    puts "Iniciando processamento..."
    throw :cancelar if condicao_de_cancelamento
    puts "Processamento concluído"
  end
end

# Múltiplos rescue
begin
  # algum código
rescue ArgumentError => e
  puts "Erro de argumento: #{e.message}"
rescue TypeError => e
  puts "Erro de tipo: #{e.message}"
rescue StandardError => e
  puts "Outro erro: #{e.message}"
end

# Rescue inline
resultado = 10 / 0 rescue "Erro na divisão"
puts resultado

# Usando raise para relançar a exceção
begin
  begin
    10 / 0
  rescue => e
    puts "Primeiro rescue: #{e.message}"
    raise  # Relança a mesma exceção
  end
rescue => e
  puts "Segundo rescue: #{e.message}"
end

# Classe com tratamento de erro
class ContaBancaria
  class SaldoInsuficienteError < StandardError; end
  
  def initialize(saldo_inicial)
    @saldo = saldo_inicial
  end
  
  def sacar(valor)
    raise ArgumentError, "Valor deve ser positivo" if valor <= 0
    raise SaldoInsuficienteError, "Saldo insuficiente" if valor > @saldo
    @saldo -= valor
  end
end

# Usando a classe com exceções
conta = ContaBancaria.new(100)
begin
  conta.sacar(150)
rescue ContaBancaria::SaldoInsuficienteError => e
  puts "Não foi possível sacar: #{e.message}"
rescue ArgumentError => e
  puts "Valor inválido: #{e.message}"
end

# Hierarquia de exceções comuns em Ruby:
=begin
StandardError
  ├── ArgumentError
  ├── IOError
  │   └── EOFError
  ├── IndexError
  ├── LocalJumpError
  ├── NameError
  │   └── NoMethodError
  ├── RangeError
  │   └── FloatDomainError
  ├── RegexpError
  ├── RuntimeError
  ├── SecurityError
  ├── SystemCallError
  ├── SystemStackError
  ├── ThreadError
  ├── TypeError
  └── ZeroDivisionError
=end

# Exemplo com logging
require 'logger'
logger = Logger.new('erro.log')

begin
  # código perigoso
rescue => e
  logger.error("Erro: #{e.message}")
  logger.error(e.backtrace.join("\n"))
  raise  # Opcionalmente relança a exceção
end