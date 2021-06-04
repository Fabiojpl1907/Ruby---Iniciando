# uma classe herda os comportamentos de uma classe mae
# não é permitida a herança multipla. herda somente de 1 classe
# posso ter castaca de heranca
# Herança é para reuso de funcionalidades

# correto é definir cada classe em seu arquivo

#  <  ->  ação de herdar

class Sensor  # sensor normal/genérico
    
    def instalar
        puts "Estou instalando o sensor"        
    end

    def iniciar
        puts "EStou inicando o sensor"
    end

    def coletar_metricas
        puts "Estou coletando metricas"
        puts "Estou analisando métricas"
    end
end

sensor = Sensor.new
sensor.instalar
sensor.iniciar
sensor.coletar_metricas

class SensorTemperatura < Sensor
    def coletar_metricas 
        puts "Estou coletando métricas de tenperatura"
        # preciso que sejam executados os metodo do pai
        super
    end 
end

puts "Sensor Temperatura"

sensor = SensorTemperatura.new
sensor.instalar
sensor.iniciar
sensor.coletar_metricas