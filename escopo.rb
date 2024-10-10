def exemplo
  local_var = 'Eu sou local'
  puts local_var # Acessível aqui
end

exemplo
# puts local_var # Erro: `local_var` não está definido aqui

class ExemploClasse
  @@class_var = 'Eu sou uma variável de classe'

  def initialize
    @instance_var = 'Eu sou uma variável de instância'
  end

  def mostrar
    puts @instance_var # Acessível aqui
    puts @@class_var   # Acessível aqui
  end
end

objeto = ExemploClasse.new
objeto.mostrar
