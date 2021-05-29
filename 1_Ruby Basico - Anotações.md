A seguir condensados da estrutura básica do **RUBY Básico** com exemplos

Nota : **( )** apresentarão em qual arquivo de aula  estão os detalhes do assunto 

**Geral** 

- irb é o ambie Ruby no terminal

- Em ruby parenteses são opcionais 

- String é uma lista de cacteres com indice inicial zero

- Manipulação de strings  ( 2_operação com string.rb )

- Manipulação de números (3_numeros.rb)

- Em Ruby posso ter elementos de tipos diferentes em um array (5_array.rb)

- Site com documentação do Ruby :   https://ruby-doc.org/

- Exercício palindromo ( 12_palindromo.rb)

  

**Comandos** 

**#**  -> Inserir comentário

**=**  -> atribuição de valor a uma variável

​	nome = "Pedro" 

​	idade = 15

**puts / p** -> Imprimir na tela

​	puts "Bom dia" 

​	puts("Bom dia")

**#{}**  -> Interpolação ( colocar execução de código ruby em uma string )

​	nome = "Maria" 

​	texto = %Q( Bem vindo #{nome}) 

​	puts "Bem vindo #{nome}"

​	puts "O total é #{ 1 + 5 }"

**.public_methods** -> usado para ver os metodos existes em uma objeto 

​	texto = "Teste"

​	numero = 5

​	texto.public_methods. # retornar os métodos de um objeto string

​	numero.public_methods. # retornar os métodos de um objeto integre



**:**  -> Simbolo. Cria um objeto unico . ( 4_simbolos.rb )



**[]  /  Array.new**  -> define / instância um objeto array ( lista de valores separados por virgula)

​	lista = []   # um array vazio

​	lista.Array.new

​	lista = [ 1 , "A" , "Teste", 2.1 ]

**<< / append**  -> adiciona elemento a uma array

​	lista << "novo item"

​	lista.append( "Mais um novo item")



**{} / Hash.new**  -> Instancia um hash ( 6_hashes.rb )

​	hash = {}

​	hash = Hash.new



**gets** -> entrada de dados pelo teclado ( 7_entrada de dados.rb )

**Desvios condicionais ( 8_desvios condicionais.rb)**

​	if else elsie end

​	unless end

​	case when else end

**operadores condicionais** 

​	**==**  igualdade

​	**!=**  diferente

​	**\>**  maior que 

​	\**<** menor que

​	**\>=** maior ou igual

​	**<=** menor ou igual



**operadores lógicos**

​	**!** negação

​	**&&** and

​	**||** ou



**Laços ( 9_laços.rb)**

​	while end

​	for in end

​	until end

​	**break**   -> sai do laco

​	**return**  -> sai do laço e do metodo onde o laco esta contido

​	**next**    -> vai imediatamente para proxima iteração

​	**redo**    -> repete o laco do inicio ( a condicao não sera avaliada)



**Definir método** ( 10_metodos.rb)

​	def end



**Atribuição Condicional** ( 11_Atribuição Condicional.rb )

​	**\||**=  -> atribui uma *valor somente* se a variavel for nula ou falsa

​	nome ||= 111



