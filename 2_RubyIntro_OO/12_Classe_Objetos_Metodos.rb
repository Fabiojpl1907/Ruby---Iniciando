# Classe -> planta
# Objeto -> criado a partir da planta
# quando crio um objeto -> instância

# class  NomeDalasse end
class MinhaClasse
    
end

#convencao de nomeação 
# variavel e métodos ->  tudo minusculo eusando "_"para separar palavras
# Exemplos :  meu_nome   palindromo

# classe - padrão camelcase -> NomeDaClasse

#criar o objeti a partir da classe
# objeto = NomeDaClasse.new

#variaveis são tags

nome = "Teste"
outro_nome = nome
puts outro_nome
nome.upcase!
puts outro_nome

# neste caso outro_nome terao mesmo ID de nome
# agira como um epelho de nome 
# tudo que eu altear em nome ira se refletor em outro_nome

#metodos e variaveis 

#adicionar um comportamento na classe
# digo que adiciono um método

# getter e setter 

# Nota : so os metodos da classe consgue acessar a vaiavel de instância
class Pessoa

   def initialize(nome)  # construtor
        @nome = nome     # nome que vem como parametro, salvo em uma variavel de instancia
   end

   def imprimir_ola
       puts "Ola #{@nome}"
   end

   #1. metodo para troca de nome 
   #def nome=(novo_nome)
   #     @nome = novo_nome       
   #end

   # 2. substituir o metodo writer por uma linha só metodo setter
   attr_writer :nome


end

# criar uma pessoa , com nome incial "Fábio"
fabio = Pessoa.new("Fabio")

p fabio # por padrão o Ruby chama o inspect do objeto. consigo ver todas as variaveis do objeto que estão na memória
p fabio.inspect

pessoa2 = Pessoa.new("Nova")
p pessoa2

#chamando o método imprimir pessoa
#chamo o objeto que tem a estrutura da clase pessoa e passo o méodo que eu quero 
fabio.imprimir_ola
pessoa2.imprimir_ola

#trocando nome
pessoa2.imprimir_ola
pessoa2.nome = "Maria"
pessoa2.imprimir_ola

# como acessar uam variavel de uma class fora de seus métodos ?
# uso o metodo instance_variable passando o nome da variavel
# não recomendavel - se precisa disto significa que sua classe não esta expondo os dados de uma maneira certa
objeto = Pessoa.new("Fora")
puts objeto.instance_variable_get(:@nome)
