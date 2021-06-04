# para cirar a opção de conta com taxa
# foi utilizado o conceito de herança 

class ContaComTaxa < ContaBancaria

    #opcoes  para evitar numero ma'gico -> 1 
    TAXA = 2  # criei uma constante TAXA ( letra maiuscula)
    
    def self.taxa  # Metodo de classe
        2
    end

  
    def transferir( conta_destino, valor)  # redefinindo o metodo transferir

    # primeiro executo o metodo que vem da classe raiz 
    # se houver erro não ira para o proximo passo é trato antes 

    # super(conta_destino, valor)   # uso o transferir de ContaBancaria
    super                           # como os argumentos são os mesmos recebidos
                                    # posso usar somente o super
    
    # debitar(ContaComTaxa.taxa)  # faço o débito da taxa com metodo 
    debitar(TAXA)                 # opção de realizar o debitar usando a constante  
   
  end

end