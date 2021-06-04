# metodos de classe são uteis quando tem uma funconalidade 
# que não é tão dependente do estado do objeto
# fica disponivel so para a classe 
# self. 

# variavel de classe usada para guardar um estado
# @@

# nao são muitas utilizads pois tem um comportamento de variavel global

#definir um metodo de clase
class Pessoa
    @@numero_de_pessoas = 0  # variavel de classe
    def self.gerar
        @@numero_de_pessoas += 1
        puts "fazer algo"
        Pessoa.new        
    end

    def self.numero_pessoas
        @@numero_de_pessoas        
    end
end

pessoa = Pessoa.gerar
pessoa = Pessoa.gerar
pessoa = Pessoa.gerar

p Pessoa.numero_pessoas
