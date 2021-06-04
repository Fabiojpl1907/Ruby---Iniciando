# conta bancaria
# "_cc" na vai indicar -> Conta Corrente

class ContaBancaria
    def initialize( correntista, valor_inicial)
        @correntista = correntista  # @ variavek de instancia
        @saldo_cc = valor_inicial 
    end

    def transferir(conta_destino, valor)
        # logica de trasnferencia 

        # passo 1 - tem saldo ? 
        if @saldo_cc >= valor     # usa o metodo saldo, aplicado ao correntista que pediu a transferencia
            # puts "Consigo transferir"  -> incluido durante o teste de lógica do metodo
            debitar(valor)
            conta_destino.depositar(valor)
        else
            # trato a insuficienca de saldo como erro 
            # mostra a ensagem e para , sem seguir para o debito da taxa
            raise "Saldo insuficiente" 
                                     
        end      
    end

    def saldo
        puts "\n #{@correntista}, seu saldo atual é : #{@saldo_cc}"
    end

    private

    def debitar(valor_debito)
        @saldo_cc -= valor_debito    # @valor é o valor ( saldo atual ) ligado ao objeto que solicitou a transferencia 
                           # valor_debito é o valor a ser transferido , passado por parametro ao método                        
    end
    
    protected

    def depositar(valor_deposito)
        @saldo_cc += valor_deposito # @valor é o valor ( saldo atual )  ligado ao objeto que recebe a transferencia 
                                # valor_deposito é o valor a ser transferido , passado por parametro ao método    
                                # como o metodo depositar não é chamado pelo objeto gerador ( conta_fj ) ele não pode ser private
                                # precisa ser protected                     
    end

    
end