Condensados da estrutura básica do **RUBY**.

Nota : **( )** apresentarão em qual arquivo de aula  estão os detalhes do assunto 



**Geral** 

- irb é o ambie Ruby no terminal

- Em ruby parenteses são opcionais 

- No Ruby tudo é objeto

- String é uma lista de cacteres com indice inicial zero

- Manipulação de strings  ( 2_operação com string.rb )

- Manipulação de números (3_numeros.rb)

- Em Ruby posso ter elementos de tipos diferentes em um array (5_array.rb)

- Site com documentação do Ruby :   https://ruby-doc.org/

- Rails - framework para aplicação web

- MVC - modo view controller 

- Gems - biblioteca de código compartilhas entre a comunidade :  [rubygems.org](http://rubygems.org)

- WSL - cria ambiente Linux no Windows

- IDE -> RubyMine ( assinatura cara)

- Nil -> Nulo

- DEfinir função / método -> def ...end

- Exercício palindromo ( 12_palindromo.rb)

- 

  

**Tipagem**

​	Tipagem dinamica - apresento o dado e a variavel assume o tipo

​	Tipagem forte - não permite conversão automática de tipo de dados



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

Posso executar métodos com interpolação 

**:**  -> Simbolo. Cria um objeto unico . ( 4_simbolos.rb )

**Strings**

​	Entre aspas ou apóstrofes, %q

​	Nome = “Fabio” - > aceita códigos escape 

​		\n  nova linha

​		\t  tab

​		\”  Aspas 



​	Interpolação - > *Somente se criei a string usando **“ ”*** *aspas*

​				O que esta entre {} o código Ruby irá interpretar

​        nome = “Fabio”

​		mensagem = “Bem vindo #{nome}”.  O que esta entre {} o código Ruby irá interpretar

​		mensagem = “Bem vindo #{ 1 +3 }”. 

​		juntar string ( + ) 

​		mensagem = “bem-vindo “+ nome 

​		Nome = ‘Fabio”

​		Nome = %q( meutexto) 

​		Interpolação pode ser feota com -> %Q



​	*Heredoc* ->. Definir uma variável com texto muito grande 

​		texto= <<˜TXT        delimitador ( TXT , ou o que eu quiser ) 

​			Xxxxxxxxxxxx\n

​			Xxxxxxxxxxxx\n

​			Xxxxxxxxxxxx

​		TXT 



**[]  /  Array.new**  -> define / instância um objeto array ( lista de valores separados por virgula)

Criar lista -> [ ] , nao tem tipo especific

Posso executar métodos nas listas -> nomes.lenght	

lista = []   # um array vazio

​	lista.Array.new

​	lista = [ 1 , "A" , "Teste", 2.1 ]

**<< / append**  -> adiciona elemento a uma array

​	lista << "novo item"

​	lista.append( "Mais um novo item")



**{} / Hash.new**  -> Instancia um hash ( 6_hashes.rb )

​	hash = {}

​	hash = Hash.new



**gets** -> entrada de dados pelo teclado ( 7_entrada de dados.rb )

**Desvios condicionais** ( 8_desvios condicionais.rb)

​	if else elsif end

​	unless end

​	case when else end

**operadores condicionais** 

​	**==**  igualdade

​	**!=**  diferente

​	**\>**  maior que 

​	**\<** menor que

​	**\>=** maior ou igual

​	**<=** menor ou igual



**operadores lógicos**

​	**!** negação

​	**&&** and

​	**||** ou



**Laços** ( 9_laços.rb)

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



