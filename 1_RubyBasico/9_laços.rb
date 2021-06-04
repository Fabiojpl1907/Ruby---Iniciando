# Lacos


# repetir enquanto é verdadeiro 
valor = 0
while valor < 10
    puts valor
    valor +=1  #  valor = valor -1
    break if valor == 7
end  

for i in [1, 2, 3, 4, 5 ]   # obrigatorio array 
    puts "O numero é #{i}"
end

# objeto range
range = 0..5
for i in range
    puts "O numero é #{i}"
end

for i in 0..5
    puts "O numero é #{i}"
end

# usando metodo each
lista = 0..5

lista.each do |meuValor|
    puts "Meu valor (usando each) é #{meuValor}"
end    

# each com chave
hash = {nome: "Teste", idade: 29}

hash.each do | chave, valor|
    puts "Minha chave é #{chave} com o valor #{valor}"
end


# executar enquanto é falso
valor = 0
until valor == 10
    puts valor
    valor += 1
end

# comandos
# break   sai do laco
# return  sai do laço e do metodo onde o laco esta contido
# next    vai imediatamente para proxima iteração
# redo    repete o laco do inicio ( a condicao não sera avaliada)


