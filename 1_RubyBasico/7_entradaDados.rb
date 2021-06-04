# Entrada de dados pelo teclado

# por padrão o gets acrescenta um line feed \n 

nome = gets
p nome

#remover \n
p nome.chomp
nome = gets.chomp

#programa 
puts "Digite seu nome"
nome = gets
puts "Seu nome é #{nome}"