
Nota : Linhas nao comentadas abaixo sao comandos de terminal / configuracao  em arquivo
# linhas comentadas sao anotacao de aulas / resultados dos comandos
# para criar o projeto siga rigorosamente a sequencia apresentada

# Rendering - Devise e Rails partial 


# <<Parte 1>> 

# redirect - solicita a um http
# redering faz 

# Explorar um pouco mais a devise - autenticacao

# criar 3 users - admin , restaurante , cliente
# inserir uma coluna no banco e esta coluna isra conter o tipo de usuário
rails generate migration add_role_to_users

# confirmar em ./db/schema.rb
# as tabelas existentes 

# editar o arquivo gerado pela generate
db/migrate/20210618193716_add_role_to_users.rb
# adicionar coluna com 3 argumentos -> Tabela - coluna - tipo
# é integer pois vai usar a controller enuns do rails
# ajustar conforme codigo abaixo
class AddRoleToUsers < ActiveRecord::Migration[6.1]
    def change
      add_column :users, :role, :integer
    end
  end

# gerar coluna
rails db:migrate  

# sera assumido que cada restaurante tem sónum usuario restaurant
# criando usuário na tabela restaurant
rails generate migration add_user_id_to_restaurants
# abrir -> db/migrate/20210618194719_add_user_id_to_restaurants.rb
# ajustar codigo
class AddUserIdToRestaurants < ActiveRecord::Migration[6.1]
    def change
      add_column :restaurants, :user_id, :integer
    end
  end

# gerar na tabela restaurante a coluna user_id
rails db:migrate

# editar o arquivo ->  ./app/models/user.rb
# enum é do rails e implementa metodos que usamos em 
# instancias de usuário
# ajustar codigo conforme abaixo 
class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    # definindo 3 tipos de usuarios admn, restaurant, customer
    enum role: [:admin, :restaurant, :customer]
  end

# Entrar no rails console 
# verificar usuário existente
user = User.last
user
user.admin?
user.role == :admin
user.restaurant?
user.customer?

# alterar o tipo do usuario existente
user.admin!
user  # vai aparecer com role admin

# atualizar : ./app/views/home/index.html.erb
# com  codigo
<h1>Home#index</h1>

<p>Hello<%= @email %></p>

<% if user_signed_in? %>
    <% if current_user.restaurant? %>
        <p>Seus produtos, <% current_user.restaurant.name %></p>
        <table>
            <thead>
                <tr>
                    <th>nome</th>
                    <th>valor</th>
                </tr>
            </thead>

            <body>
                <% current_user.restaurant.products.each do |product| %>
                    <tr>
                        <td><%= product.name %></td>
                        <td><%= product.value %></td>
                    </tr>
                <%end%>
            </tbody>
        </table>
    <% end %>
<% end %>  

# ajustar o usuario para ser do tipo restaurant
User.last.restaurant!

#alterar -> ./app/models/restaurant.rb
# com código abaixo 
class Restaurant < ApplicationRecord
    has_many :products
    belongs_to :user

    def total_of_products
        products.count
    end
end


#alterar -> ./app/models/user.rb
# com código abaixo 
class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    # definindo 3 tipos de usuarios admn, restaurant, customer
    has_one :restaurant
    enum role: [:admin, :restaurant, :customer]
  end

# no raisl console
# lincar usuário com restaurante 
# e confirmar
reload!
user = User.last
user.restaurant  
Restaurant.all
user.restaurant = Restaurant.find(1)
user.save
user.restaurant 
user.restaurant.products

#subir servidor
rails server

# <Parte 2 > 

# relacionar usuario tipo restaurant com 1 restaurante
# alterar -> code ./app/views/restaurants/_form.html.erb
# adicionar apos divisao de address
<div class="field">
    <%= form.label :user %>
    <%= form.collection_select(:user_id, User.restaurant,:id, :email, include_blank: true) %>
</div>

# alterar restaurant controllers
# arquivo -> code ./app/controllers/restaurants_controller.rb
# alterar de : 
# def restaurant_params
#     params.require(:restaurant).permit(:name, :address)
# end
#para : 
def restaurant_params
    params.require(:restaurant).permit(:name, :address, :user_id)
end



# Cadastrar outros users
# no browse, nova sessao
http://127.0.0.1:3000/users/sign_up

# acessar rails console
User.all
# colocar roles
User.find(2).admin!
User.find(3).customer!

# criar novo usuario tipo restaurant via browse
# relacionar com a role restaurante via rails console 
User.last
User.last.restaurant!

# criar um novo restaurante
# lincar ultimo usuaio criado com o restaurante

# Iniciar tema  render

#carregar arquivo ./app/views/home/index.html.erb
# esta arquivo esta ficando grande
# vamos spara-lo- lo em partes

#criar ./app/views/home/_restaurant.html.erb
# trazendo a seguinte parte do ./app/views/home/index.html.erb
<p>Seus produtos, <% current_user.restaurant.name %>:</p>
<table>
    <thead>
        <tr>
            <th>nome</th>
            <th>valor</th>
        </tr>
    </thead>

    <body>
        <% current_user.restaurant.products.each do |product| %>
            <tr>
                <td><%= product.name %></td>
                <td><%= product.value %></td>
            </tr>
        <%end%>
    </tbody>
</table>


# em ./app/views/home/index.html.erb
# colocar linha abaixo no lugar do codigo retirado 
# <%= render 'restaurant' %> 

# render procura um arquivo na mesma pasta 
# posso passar argumentos ( exemplos no video em 11:20 mm:ss )

# em ./app/views/home/index.html.erb
# alterar codido para renderizar nova sesso Customer
<h1>Home#index</h1>

<p>Hello <%= @email %> </p>

<% if user_signed_in? %>
    <% if current_user.restaurant? %>
        <%= render 'restaurant' %>
      <% elsif current_user.customer? %>
        <%= render 'customer' %>
    <% end %>
<% end %>   


# criar arquivo ./app/views/home/_customer.html.erb
# com o codigo
<p>Restaurantes</p>

<table>
    <thead>
        <tr>
            <th>nome</th>
        </tr>
    </thead>

    <tbody>
        <% Restaurant.all.each do |r| %>
        <tr>
           <td><%= r.name %></td>
           <table>
           <tbody>
            <% r.products.each do |p|%>
                <tr>
                    <td>-> <%= p.name %></td>
                </tr>
            <% end %>
           </tbody>
           </table> 
        </tr>
        <% end%>
    </tbody>
</table>


# Fim modulo Devise e Render 







