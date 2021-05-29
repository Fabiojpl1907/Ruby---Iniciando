#operações com strings
#lista de caracteres inicando em 0 ( zero ) 

nome = "Fábio"
puts nome

puts ["a", "b", "c"]  # quebra a linha
p ["a", "b", "c"]  # vai apresentar em formato de array e quebra a linha 
print ["a", "b", "c"]  # não quebra a linha 

nome = "Fábio"
p nome[0]

# p nome[nome.length - 1]
#p nome[-1]  # pega a ultima letra do nome
#p nome[-2]  # pega o penultima letra

p nome.chars  # retorna um array formada a partir da string
p nome.chars.length

p nome[0,2] # pegar uma sub-string , informo o inicio e quantos carcteres eu quero  

# multiplicação de strings
puts "Cabeçalho"
puts "-" * 10
puts "Texto de informação"

# formatar numero
numero = 43
puts "O numero é %05d" % numero

# limpar espaços em branco
mensagem = "   texto aqui vai    "
puts mensagem
puts mensagem.strip

# tudo maiusculo / tudo minusculo
# somente mostrando o valor alterado 
puts nome.upcase
puts nome.downcase

# mostra e altera o valor da variavel 
nome.upcase!
nome.downcase!

# apresenta o id de memoria da variavel 
nome.object_id
nome.upcase.object_id

#Primeira letra maiuscula
p nome.capitalize

# substiutir string
p nome.gsub("F", "V")  substiutia o primeiro parametro pelo segundo - case sensitive
mensagem = "Bom dia nome"
p mensagem.gsub( "nome", nome)

#transformar texto em lista, separando por espaço
lista = "nome 1 nome2 texto3"
p lista.split
lista2 = lista.split

p lista2.class

# indicando separador a ser usado 
lista = "nome-1-nome2-texto3"
p lista.split("-")

# heredoc - objeto com um texto extenso
# delimitador - uma tag que escolho para indicar onde inicia e termina o texto 
# no exemplo o delimitador é a palvra -> teste 
texto = <<~teste
Ola Bom dia a todos

este é um teste em Ruby 

Grato
teste

puts texto