Nota : Linhas nao comentadas abaixo sao comandos de terminal / configuracao  em arquivo
# linhas comentadas sao anotacao de aulas / resultados dos comandos
# para criar o projeto siga rigorosamente a sequencia apresentada


#1. CRUD - Controller - Models - View ###########################################################
# CRUD (acrónimo do inglês Create, Read, Update and Delete) 
# são as quatro operações básicas (criação, consulta, atualização e destruição de dados) 
# utilizadas em bases de dados relacionais (RDBMS) fornecidas aos utilizadores do sistema
# CRUD - Formularios pra realizar operacoes  com dados 
# prototipar validar ideias - no dia a dia é pouco usado
# cria migracao - alteraco em banco de dados
# confirmar funcionamento
rails server
# se logar no site via 3000/users/sign_in
# sair do server
crt + c

rails generate scaffold restaurant name:string address:text
#       invoke  active_record
#       create    db/migrate/20210610183908_create_restaurants.rb
#       create    app/models/restaurant.rb
#       invoke  resource_route
#        route    resources :restaurants
#       invoke  scaffold_controller
#       create    app/controllers/restaurants_controller.rb
#       invoke    erb
#       create      app/views/restaurants
#       create      app/views/restaurants/index.html.erb
#       create      app/views/restaurants/edit.html.erb
#       create      app/views/restaurants/show.html.erb
#       create      app/views/restaurants/new.html.erb
#       create      app/views/restaurants/_form.html.erb
#       invoke    resource_route
#       invoke    helper
#       create      app/helpers/restaurants_helper.rb
#       invoke    jbuilder
#       create      app/views/restaurants/index.json.jbuilder
#       create      app/views/restaurants/show.json.jbuilder
#       create      app/views/restaurants/_restaurant.json.jbuilder
#       invoke  assets
#       invoke    scss
#       create      app/assets/stylesheets/restaurants.scss
#       invoke  scss
#       create    app/assets/stylesheets/scaffolds.scss


#  ver rotas criadas - preciso das rotas para as controllers fazer as operacoes crud
rails routes | grep restaur

#cria views html e jason - posso acesar via web ou via aplicativo 
# migrar o banco
# /migrate/schema.rb mostra as tabelsas criadas
#cria com timestamp ( numeros a frente do nome de alguns arquivos )
rails db:migrate 
# == 20210610183908 CreateRestaurants: migrating ================================
# -- create_table(:restaurants)
#    -> 0.2499s
# == 20210610183908 CreateRestaurants: migrated (0.2501s) =======================

# criar um restaurante novo
rails server
http://127.0.0.1:3000/restaurants # via browser 




# Fim 1. CRUD ######################################################


#2. MODELS############################################################

# criar produto
# criar migration e model , com interligacao com "restaurant"
rails generate model product name:string value:float restaurant_id
# invoke  active_record
# create    db/migrate/20210610191840_create_products.rb
# create    app/models/product.rb
# vai precisar ajustar ...create_products.rb para corrigir a inteligacao
# t.integer :restaurant_id

rails db:migrate 
# == 20210610191840 CreateProducts: migrating ===================================
# -- create_table(:products)
#    -> 0.0103s
# == 20210610191840 CreateProducts: migrated (0.0155s) ==========================

# ligar restaurante com produtos
# 1 produto pode estar em mais de 1 restaurante
# 1 restaurante pode ter varios produtos
# alterar ./app/models/product.rb e ./app/models/restaurante.rb
product -> belongs_to :restaurant
restaurant -> has_many :products

# carregar todo o o ambiente de desenvolvimento 
rails console
r = Restaurant.new( name:"Pratao", address:"Rua 13 de maio, 1111")
# salvar e ver restautante criado no banco de dados
r.save

# criar e ver produto com relacionamento com restaurante r
p1 = Product.new( name: "Lazanha", value: 150.0, restaurant: r)
# salvar e ver produto criado no banco de dados
p1.save
# ver produtos no restaurante
r.products
#ver restautante por produto
p1.restaurant

#Fim 2. MODELS############################################################

#3. Views ############################################################
# gerar controllers
# por convencao models no singular - Controllers no plural
# no rails posso usar "short cut"para os comandos s ( server ) c( console) g (generate) 

# gerar visulaizacao para o Index
rails g controller products index  
#       create  app/controllers/products_controller.rb
#        route  get 'products/index'
#       invoke  erb
#       create    app/views/products
#       create    app/views/products/index.html.erb
#       invoke  helper
#       create    app/helpers/products_helper.rb
#       invoke  assets
#       invoke    scss
#       create      app/assets/stylesheets/products.scss


# ajustar arquivo 
./config/routes.rb
tirar get 'products/index'
colocar  resources :products, only: [:index]


# alterar arquivo 
app/controllers/products_controller.rb
# colocar dentro de Def 
@products = Product.all  


# alterar 
app/views/products/index.html.erb

# criar o codigo html para apresentar o produto 

# <h1>Products</h1>
# <table>
#     <thead>
#         <tr>
#             <th> Nome </th>
#             <th> Valor </th>
#             <th> Restaurante </th>
#         </tr>
#      </thead>       
#     <tbody> 
#        <% @products.each do |p|%>
#         <tr>
#             <th><%= p.name %></th> 
#             <th><%= p.value %></th> 
#             <th><%= p.restaurant.name %></th> 
#         </tr>
#         <%end%>
#     </tbody>
# </table>

#carregar servidor
rails server
http://127.0.0.1:3000/products # via browser 

# Nota controller de ¨products¨ fcou muito mais limpa (na mao) que a controller de ¨restaurant¨  via scaffold

# adicionar metodos nas controllers

# requisito -> criar um formulário para criar um produto

# alterar arquivo 
app/controllers/products_controller.rb
# com código abaixo
# class ProductsController < ApplicationController
#     def index
#       @products = Product.all
#     end
  
#     def new # estanciar  novo produto
#       @product = Product.new
#     end
  
#     def create # criar novo produto
      
#       # params é um helper do rais que traz os parametros que foram criados na requisicao
#       # por boas práticas nao pegamos das rotas criadas deixamos ele em método separado
      
#       @product = Product.new(product_params) 
  
#       # devolver da controller para view
#       respond_to do |format|
        
#         if @product.save  # pode html, jason , etc 
#           format.html { redirect_to products_path, notice: 'Produto criado'}
#         else
#           format.html { render :new}
#         end
#       end
#     end
  
#     private
    
#     def product_params
#       # camada extra de seguranca , permite somente trata os requisitos que espero     
#       params.require( :product).permit(:name,:value,:restaurant_id)
#     end
  
#   end

#criar arquivo
app/models/view/products/new.html.erb
#com o código a seguir 
# <h1>Novo produto</h1>
# <%= render 'form', product: @product %>


#criar arquivo
app/models/view/products/_form.html.erb
#com o código a seguir 
# <%= form_with( model: product, local: true) do |form|%>
#     <div class="field">
#         <%= form.label :name %>
#         <%= form.text_field :name %>
#     </div>
    
#     <div class="field">
#         <%= form.label :value %>
#         <%= form.text_field :value %>
#     </div>
    
#     <div class="field">
#         <%= form.label :restaurant %>
#         <%= form.collection_select(:restaurant_id, Restaurant.order(:name), :id, :name, include_blank: true) %>
#     </div>
    
#     <div class="actions"> 
#         <%= form.submit %>
#     </div>
#     <% end %>


#alterar as rotas 
# ajustar arquivos ./config/routes.rb
resources :products, only: [:index, :new, :create]

# acessar no browse products/new

# para verificar rotas e qual metodo usar no redirect
# via terminal 
rails routes | grep product

# products GET    /products(.:format)  products#index
# POST   /products(.:format)           products#create
# new_product GET    /products/new(.:format) products#new

