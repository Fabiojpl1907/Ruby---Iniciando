# criar classe responsavel para representar conta bancaria
# criar metodo para transferir valor entre contas 
# criar conta com tarifa para transferir

# ciando a estrutura das funcionalidades necessárias
# isto ira dirigir a cosntruçãod das classes e metods necessários
# para dar suporte as funcionalidades

# DICA -> ir rodando passo a passo durante a criação de classes e nomeação de metodos
# ira garantindo que nossa estrutura de classe e metodos estão corretas
# DICA -> Ir testando a logica d eprogramação inicialmente com mensagens
# coerente açao a ser realizada 
# DICA teste casos dentro da logica , por exemplo inicar saldo com valores menores ou maiores do que ira transferir
# verificando se a ção ocorreu conforme pensado 



#importar classes - colocar estes comandos confirmar criando as classes
# que dão suporte as funcioalidades
require "./classes/contabancaria"   # importo pelo nome do arquivo
require "./classes/conta_com_taxa"

# criar contas bancarias
   # conta_fj = ContaBancaria.new("Fabio Jose", 200)  -> projeto inicial 
conta_fj = ContaComTaxa.new("Fabio Jose", 100)   # projet 2 , conta com tarifa / taxa]
conta_eg = ContaBancaria.new( "Elizabeth", 200) 

# trasferencia
# efetuado a trativa de erro quando saldo insuficiente
begin
    conta_fj.transferir( conta_eg, 50)  # vai pegar o objeto conta que tem um correntista e um valor 
                                        # e transferir um valor para outro correntista 
rescue StandardError => meu_erro
    puts "\n Não foi possivel transferir : #{meu_erro.message}"  # traz a mensagem de erro colocada no raise no metodo transferir na classe ContaBancaria
end                               

#Mostra saldo

puts conta_fj.saldo    # devera apresentar 100 -50 -2 ( taxa ) = 48
puts conta_eg.saldo   # devera apresentar 200 + 50 = 250 

# transferir com taxa -> 12:56