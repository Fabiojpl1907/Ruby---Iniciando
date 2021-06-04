#Exercício
# Definir método que verifica se é palindromo
#usar gets para pedir input de dados
# imprimir se é palindromo ou não 
# dica ruby-doc.org  -> site documentação do ruby
# vá em core API
# procurar classe string
# ler todos os metodos 
# tem um metodo muito til para este exercicio -> reverse

# solução 1 
# padrão comunidade ruby , se o metodo retorna True ou False , nomeia com ? no final 
# nota : array/ lista começa com indice 0 

def palindromo?(palavra)
    
    palavra = palavra.downcase  # ajustar para evitar diferençao de digitação maisucula minuscula
        
    palavra_reversa = ""

    indice = palavra.length

    until indice == 0
        letra = palavra[indice-1]
        palavra_reversa << letra   # string tem coportamentos de listas 
        indice -= 1
    end  
    
    # opção 1 de retorno
    puts "Palavra :  #{palavra} é  palindromo" if palavra_reversa == palavra
    
    unless palavra_reversa == palavra
        puts "Palavra :  #{palavra} não é  palindromo"
    end

    #opção 2 de retorno - true ou false
    palavra_reversa == palavra  # se for true retorna true , se for false , retorna false



end    

puts palindromo?("Ovo")
puts palindromo?("teste")


# solução 2
# usando metodo reverse
# para ver todos os metodos de uma classe , string por exemplo
# rodar no irb ->  "teste".public_methods
def palindromo?(palavra)
    palavra.downcase == palavra.downcase.reverse
end    
