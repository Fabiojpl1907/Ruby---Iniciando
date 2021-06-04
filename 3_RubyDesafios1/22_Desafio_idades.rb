
 # Exercio  proposto
#idade_dias = gets.strip.to_i

#idade_anos = idade_dias / 365
#idade_dias %= #complete o codigo

#idade_meses = idade_dias / 30
#idade_dias %= #complete o codigo

#puts "#{idade_anos} ano(s)"
#puts "#{idade_meses} mes(es)"
#puts "#{idade_dias} dia(s)"


# solucao apresentada 

idade_dias = gets.strip.to_i

idade_anos = idade_dias / 365
idade_meses = (idade_dias % 365) / 30
idade_dias = (idade_dias % 365) % 30 

puts "#{idade_anos} ano(s)"
puts "#{idade_meses} mes(es)"
puts "#{idade_dias} dia(s)"