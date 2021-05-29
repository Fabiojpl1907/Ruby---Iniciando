# -> lembrar de salvar antes de rodar 
# comentario - ira aprsentar hello world
puts "Hello wordl"

puts texto

# %q
texto = %q( Ruby é bem intuitivo)
puts texto
#intepolação com %Q
nome = "Pedro"
texto = %Q( Bem vindo #{nome})
puts texto

#ver metodos
texto = "texto"
puts texto.public_methods

puts texto.lenght

#operações com strings
#lista de caracteres inicando em 0 ( zero ) 
nome = "Fábio"
puts nome