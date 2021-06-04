# quando não especifico , os metodos são publicos
# opcoes -> private  protected 
# private - so vai poder ser chamdo dento da classe
# private pode ser chamado dentro de sua própri instancia
# protected  podem ser chamados por quelquer isntancia se for da mesma classe/subclase


class MinhaClasse

    def m1
        puts "M1"
        m2  # faco o m1 chamar os metodos privados 
        m3  # escapsulo para não expor os metodos privados
    end
    
    private  # tudo que esta abaixo , será privado 
    # private def m2    # somente m2 sera privado
    def m2
        puts "M2 - privado"
    end

    def m3
        puts "M3 - Privado"
    end

    protected
    def m5
        puts "M5 - Privado"
        
    end
end

## saimos do contexto da classe
obj = MinhaClasse.new
obj.m1

class SubClasse < MinhaClasse
    
    def m4
        
        # o abaixo nao vai funcional porque nao posso chamar
        # pois o  metodo private em outro objeto senao o que estou trabalhando
        ## outro_objeto = MinhaClasse.new
        ## outro_objeto.m2
        
        m1
        puts "M4"

        # o abaixo vai funcional porque 
        # o metodo é protected 
        outro_objeto = MinhaClasse.new
        outro_objeto.m5
        
    end
    
end

puts "Teste subclasse"
novo = SubClasse.new
novo.m4

# Tudo em OO é troca de mensagens 
# para acessar algo em um metodo privado 
# posso usar o metodo send (  não indicado ) 
puts "Fazendo gambiarra"
obj.send(:m2)