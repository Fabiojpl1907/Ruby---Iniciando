#numeros

# inteiro / float

puts 42  # inteiro
puts 42.class

puts 42.42 # float
puts 42.42.class

# ignora underline
puts 123_500

# Somar integer + float - soma é um metodo
# no ruby tudo é objeto e um metodo 
soma = 5 + 3.2
put 5.send("+", 3.2)

#ver os metodos de um numero - integar ou float
puts 5.public_methods
puts 5.1.public_methods
puts 5.1.public_methods.grep /\+/  # procurar um metodo

#é par ou impar ? 
p 5.even? #par
p 5.odd?  #impar
