# Quando nao especifico o BD o rails usa SQLite3 ( baseado em arquivo ) 
# Para especificar um determinado  BD -> rails new projectName -d postgresql  
# conferir onBD utilizado na criação do projeto 
cat projeto_1/config/database.yml

# SQLite3 
# banco de dados pasta -> 
projeto_1/db

#  criar tabela
# criar pelo rails - versiona e cria tabela de migração ( trabalho em equipe)

# MVC - a camada que fala com BD é M - Model
# framework ORM - no rails ele procura a tabela que case com o modelo/classe

# raisl gera os ids automaticamente , nao preciso colocar ao gerar uma tabela

# criar a tabela produtos , com os atributos nome, preco e status
# sera gerado o codigo e o modelo

# Nota : crie as tabelas no rails com nome em ingles
# rails pluraliza em ingles
# ele cria o nome da tabela colocando o nome do moldelo no plural
# exemplo modelo -> product  tabela -> products

bin/rails generate model Produto nome:string preco:decimal status:boolean

# resulado
#Running via Spring preloader in process 3989
#      invoke  active_record
#      create    db/migrate/20210603152156_create_products.rb
#      create    app/models/product.rb
#      invoke    test_unit
#      create      test/models/product_test.rb
#      create      test/fixtures/product.yml

# criou o banco de dados e a migração
# a migracao é o codigo que ira alterar o nosso BD
# db/migrate/20210603151029_create_product.rb
# toda atualização da tabela é registrado o timestamp 

# para não aceitar nulo ->  t.string :nome, null: false

# rodando migração 
bin/rails db:migrate 

#resultado
#== 20210603152156 CreateProducts: migrating ===================================
#-- create_table(:products)
#   -> 0.0045s
#== 20210603152156 CreateProducts: migrated (0.0046s) ==========================

# fazer rollback
bin/rails db:rollback

# o rails olha o change , se nao tem cria , se exite delata

# raisl sabe o que falta migrar
# tudo gerenciado pelo < migrate > 

# acessar tabela via console
bin/rails console
irb(main):001:0> Product
# => Product (call 'Product.connection' to establish a connection)

# posso executar metodo no console 
Product.countProduct

# se ao rodar o consloe e chamar seu modelo obter a menssagem
# in `<main>': uninitialized constant Produtos (NameError)
# sai do IRB e rode no terminal -> spring stop
# isto deve normalizar o ambiente e da proxima vez o console funcionara corretamente 

# inserir valores
# precisa colocar o nome dos atributos
Product.create(preco: 2100.00 , status: true, nome: "Produto1")

#atualizar
product.update(price: 42.54)

# preco em formato float
product.price.to_f

# todos os registros de produto
Product.all

# Condicao da pesquisa
Product.where( status: true)

# retorna no formato array
Product.where( status: true).to_a


# percorrer todos os produtos
Product.all.each do |product|
    puts"O nome do produto é : #{product.nome}"
    end

# abrir o console do banco de dados em uso
bin/rails db