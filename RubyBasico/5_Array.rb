# Array -> lista de valores , separados por virgula

# defindo Array
lista = []
lista1 = Array.new  # ( instancia um novo objeto da classe )

# em Ruby posso ter elemntos de tipos diferentes
lista = [ 1 , "A" , "Teste", 2.1 ]
puts lista[1]  # acessando o segundo elemnto da lista

# adicionando elemento na lista
lista << "novo item"
lista.append( "Mais um novo item")
p lista

# metodos interessantes
p lista.length
p lista.empty?
p lista.first
p lista.last

# somar listas 
lista1 = [ "a", "b"]
lista3 = lista + lista1
puts lista3