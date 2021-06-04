# importar codigos que estão em outros arquivos
# tenho 2 arquivos , contendo 2 classes
# 1 -> pessoas
# 2 -> carros

# no arquivo principal preciso linkar estas arquivos/classes
# indicando o diretorio e o nome do arquivo
require "./classes/pessoa"
require "./classes/carro"

# require tambem link referencias externas 

fabio = Pessoa.new("Fabio")
carro = Carro.new("Audi", fabio)

p fabio
p carro

# instalar uma bilbioteca via gem
# no terminal ->  gem install %nomedabiblioteca%
# no exercio bibiloteca -> awesome_print
#importanado a bilbioteca
require "awesome_print"

puts "Usando o awesome_print"
ap fabio
ap carro

# tempo  - 01:19 h:min 