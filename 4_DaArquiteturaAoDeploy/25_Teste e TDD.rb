
Nota : Linhas nao comentadas abaixo sao comandos de terminal / configuracao  em arquivo
# linhas comentadas sao anotacao de aulas / resultados dos comandos
# para criar o projeto siga rigorosamente a sequencia apresentada

# << TDD parte 1  >> 

# Teste e TDD
# RSpec - gem para TDD
# Minitest ( retirado pelo -T na hora de gerar o projeto )
# factory_bot 
#faker - gerar dados fakes para teste

# colocar gems no Gemfile no ambiente de test
gem 'rspec-rails'
bundle install

# rodar genetare 
rails generate rspec:install

# caso nao rode o generate tente o abaixo e depois rode o generate novamente
spring stop

# criar nova e arquivo 
./app/spec/models/restaurant_spec.rb
# com conteudo abaixo ( sem os comentários # ) 
# require 'rails_helper'

RSpec.describe Restaurant do
    context 'testing rspec' do
        it do
            expect(1).to eq 2
        end
    end
end

# rode no terminal
rspec 

# << TDD parte 2 >> 

# criar um teste aplicado o conceito de TDD
# para cada restaurante mostrar o total de produtos 

# alterar o arquivo
./spec/models/restaurant_spec.rb
# usar código abaixo( sem os comentários # ) 
require 'rails_helper'
RSpec.describe Restaurant do
    context 'testing total of products' do
        it 'returns total of products for a specific restaurant' do
            restaurant = Restaurant.create( name: 'restaurant 1', address: 'end 1')

            product1 = Product.create( restaurant: restaurant, name: 'p1', value: 10)
            product2 = Product.create( restaurant: restaurant, name: 'p2', value: 20)    
            product3 = Product.create( restaurant: restaurant, name: 'p3', value: 30)    
        
            expect(restaurant.total_of_products).to eq 3
        end
    end    
end

# alterar o arquivo para criar o metodo total_of_products
./app/models/restaurant.rb
# usar código abaixo
class Restaurant < ApplicationRecord
    has_many :products

    def total_of_products
        products.count
    end
endb

# rodar teste no terminal
rspec spec/models/restaurant_spec.rb

# trazer para tela total de produtos de um restaurante
# atualizar arquivo 
./app/views/restaurants/index.html.erb
# inserir código abaixo  ( linhas sem comentários) 

# <p id="notice"><%= notice %></p>
# <h1>Restaurants</h1>
# <table>
#   <thead>
#     <tr>
#       <th>Nome</th>
#       <th>Endereco</th>
        <th>Total de produtos</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>

#   <tbody>
#     <% @restaurants.each do |restaurant| %>
#       <tr>
#         <td><%= restaurant.name %></td>
#         <td><%= restaurant.address %></td>
          <td><%= restaurant.total_of_products %></td>
#         <td><%= link_to 'Show', restaurant %></td>
#         <td><%= link_to 'Edit', edit_restaurant_path(restaurant) %></td>
#         <td><%= link_to 'Destroy', restaurant, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>
# <br>
# <%= link_to 'New Restaurant', new_restaurant_path %>


# << TDD parte 3 >>  

# usando o   para criar massas de dados 
# alterar Gemfiles no ambiente de test
gem 'factory_bot_rails'
gem 'faker'
gem 'shoulda-matchers'
# no terminal
bundle install
# se bundle informar que nao tinha direito de escrita 
# em algum diretório gem,  rodar 
sudo gem install factory_bot_rails
sude gem install faker
sudo gem shoulda-matchers

# confirmando 
gem list | grep fac
gem list | grep faker

# inserir Shoulda-matcher em 
./spec/rails_helper.rb
# inserir código abaixo a partir da linha 9
# para should cahmar com que esta integrando   

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end 


# Editar
./app/models/restaurant.rb
./app/models/product.rb


./spec/models/restaurant_spec.rb
# inserir código abaixo  ( linhas sem comentários) 
#RSpec.describe Restaurant do
    it { should have_many(:products)}
#    context 'testing total of products' do


# criar arquivo
touch spec/models/product_spec.rb
# inserir código abaixo
require 'rails_helper'

RSpec.describe Product do
    it { should belong_to(:restaurant)}
end

# rodar teste no terminal 
rspec . 


# o Factory ( masssa de dados ) e fakers ( dados )
# alterar rails_helper
# incluir em RSpec.configure do |config|
config.include FactoryBot::Syntax::Methods

#criar arquivos para as factories
# como esta criando massas de dados usar no plural
# restaurants / products
mkdir spec/factories

touch spec/factories/products.rb
# conteudo
FactoryBot.define do
    factory :product do
          
    end 
end

touch spec/factories/restaurants.rb
# conteudo
FactoryBot.define  do
    factory :restaurant do
        name{'Foo'}
        address{ 'bar'}    
    end 
end

# testando no console
rails console
FactoryBot.build( :restaurant)


# aplicando o Fakers
# veja na documentacao da Faker as bases de dados que podem ser usadas 
# https://github.com/faker-ruby/faker

# Alterar products.rb
require 'faker'

FactoryBot.define do
    factory :product do
       name { Faker::Movies::StarWars.droid}
       value { rand(100) } 
       restaurant        # factory linka automaticamente restaurante x produto  
    end
end


# Alterar restaurant.rb
require 'faker'

FactoryBot.define  do
    factory :restaurant do
        name{Faker::Movies::StarWars.character}
        address{ Faker::Movies::StarWars.planet }    
    end 
end


# Testar no rails console - deve aparecer dados coerentes coo fakers escolhido
> FactoryBot.build( :product)
> FactoryBot.build( :restaurant)

# alterar o arquivo : ./spec/models/restaurant_spec.rb
# usar código abaixo( sem os comentários # ) 
require 'rails_helper'
RSpec.describe Restaurant do
    it { should have_many(:products)}
    context 'testing total of products' do
        it 'returns total of products for a specific restaurant' do
            restaurant = FactoryBot.create( :restaurant)

            product1 = FactoryBot.create(:product, restaurant: restaurant)
            product2 = FactoryBot.create(:product, restaurant: restaurant)
            product3 = FactoryBot.create(:product, restaurant: restaurant)   
        
            expect(restaurant.total_of_products).to eq 3
        end
    end    
end

# testar - tem que passar no teste
rspec ./spec/models/restaurant_spec.rb

# refatorar 
./spec/models/restaurant_spec.rb
# usar código abaixo
require 'rails_helper'
RSpec.describe Restaurant do
    it { should have_many(:products)}

    context 'testing total of products' do
        
        let(:restaurant) {FactoryBot.create(:restaurant)}   

        before do
            product1 = FactoryBot.create(:product, restaurant: restaurant)
            product2 = FactoryBot.create(:product, restaurant: restaurant)
            product3 = FactoryBot.create(:product, restaurant: restaurant)  
        end
             
        it 'returns total of products for a specific restaurant' do
            expect(restaurant.total_of_products).to eq 3
        end
           
    end    
end

# testar - tem que passar no teste
rspec ./spec/models/restaurant_spec.rb

# alterar o arquivo 
./spec/models/restaurant_spec.rb
# objetivo , alterar a quantidade de produtos cada vez que rodar o teste
# usar código abaixo
require 'rails_helper'
RSpec.describe Restaurant do
    it { should have_many(:products)}

    context 'testing total of products' do
        
        let(:restaurant) {FactoryBot.create(:restaurant)} 
        let(:total) {rand(5)}  

        before do
            (1..total).each do |item|
                FactoryBot.create(:product, restaurant: restaurant)
            end    
        end
             
        it 'returns total of products for a specific restaurant' do
            expect(restaurant.total_of_products).to eq total
        end     
    end    
end

# testar - tem que passar no teste
rspec ./spec/models/restaurant_spec.rb

#Fim modulo TDD

