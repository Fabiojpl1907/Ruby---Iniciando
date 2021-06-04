#metodos

def meu_metodo(parametro1, parametro2)  # nao precisa definir o tipo do parametro
    puts "meu método foi executado. Par #{parametro1} e #{parametro2}"
end    

# return é opcional . Ruby sempre retorna o  resultado da ultima linha

def soma(a,b)
    a + b      # é a mesma coisa de colocar << return a + b >> 
end


def soma( valor1, valor2)
    puts "Estou somando #{valor1} e #{valor2} "
    return valor1 + valor2
end  
puts   "Vou executar a soma"
puts soma(10,5)


# valores opcionais
def soma( valor1, valor2 = 1)  # defino um valor padrao para o parametro , aso eu nao passe um valor
    puts "Estou somando #{valor1} e #{valor2} "
    return valor1 + valor2
end  
puts   "Vou executar a soma"
puts soma(10)

# parametros nomeados e passo os valores em qualuer ordem
def soma( valor1:, valor2:)
    return valor1 + valor2
end  
puts   "Vou executar a soma"
puts soma(valor2: 10, valor1: 5 )

#valor opcional em nomeados
def soma( valor1:, valor2: 0)
    return valor1 + valor2
end  
puts   "Vou executar a soma"
puts soma(valor2: 10, valor1: 5 )
