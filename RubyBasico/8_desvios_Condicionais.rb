# operadores condicionais
# ==  igualdade
# !=  diferente
# > maior que
# >= maior ou igualdade
# < menor
# <= menor ou igual 

valor = 60
texto = "Eu sou "
if valor > 50
    puts "#{texto} maior que 50"
   else
    puts "#{texto} menor que 50"
end

# operadores lógicos
# ! negação
# && and
# || ou

valor = 65
if valor >= 50 && valor <= 100
    puts "Estou entre 50 e 100"
end

valor = 50
if valor > 50
    puts "Eu sou maior que 50"
  elsif valor == 50
    puts "Eu sou igual a 50"
  else
    puts "Eu sou menor de 50"
end


# apenas nill e false são false , o resto é true

valor = 51
puts "Eu sou maior que 50" if valor > 50

# cadeia se for falso

# ternário

valor = 20 
valor > 50 ? puts "maior que 50" :  puts "menor que 50"

#unless ( se não for verdade verdadira ) 
valor = 20 
unless valor > 50
    puts "tudo certo"
end

# case
linguagem = "ruby"

case linguagem
    when "ruby"
        puts "Sou Ruby"
    when "golan"
        puts "Sou Golan"
    else
        puts "Não conheço esta linguagem"
end                

#obter numero
puts "Digite m valor : "
valor = gets.chomp.to_i

texto = ""
if !texto.empty?
    puts "cheia"
  else
    puts "vazia"
end    

puts "Digite algo : "
valor = gets.chomp.to_i
unless valor == 100
 puts "nao é 100"
end 

