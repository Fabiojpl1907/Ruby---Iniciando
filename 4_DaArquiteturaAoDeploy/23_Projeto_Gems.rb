Nota : Linhas nao comentadas abaixo sao comandos de terminal / configuracao  em arquivo
# linhas comentadas sao anotacao de aulas / resultados dos comandos
# para criar o projeto siga rigorosamente a sequencia apresentada

# Projeto : iEat - Delivery de pedidos

# ​Modelo - Model View Controle

# Passos do projeto
# ​	Modelos / banco de dados
# ​	Autenticação
# ​	Testes
# ​	Workers
# ​	Docker
# ​	Deploy



## Dependencias
# Sites referencia	
# https://rubyonrails.org/
# Banco de dados do projeto
# Postergresql -> https://www.postgresql.org/download/
# Instalar Gems
# ​	gem install pg
# ​	gem install nokogiri
# Instalar Node e Yarn


## Criar projeto sem carregar a gem padrao de testes
# teste serao personalizados avante
# via terminal 
rails new DevEat -d postgresql -T



## GEM 
# no rails  as aplicacao / logica ficam no app
# assets javascript e css3
# chanel - action cable web socks
# controllers - recebem requisicoes do browse
# helpers
# javascript
# jobs
# mailers - envio de email
# models
# view -> html
# pode tirar durante a criacao  como argumentos 

# database config - postgresql
# cria 3 ambientes ->  dev / test / production


## Gems ( libraries - maioria opensource) 
# reutilizar codigo
# Bundler - gerenciar dependencias
# RubyGems - repositorio aberto
# gemfile - ajustamos, acrescentalos as gems que precisamos
# gemfile.lock ( nao mexe ) 
# senao epecifico a versao ele traz a ultima versao
# boa pratica e indicar a versao
# apos alterar o arquivo gemfile , rodar -> no diretorio do projeto

# grupos
# posso criar grupos e definir gems para o grupo

## DEVISE - Autenticacao devise ( git hub ) 
# composta por 10 modulos
# autenticacao
# omniauth ( via facebook , google, etc ) 
# confirmable - email de confirmacao
# recorvable - recuperar senha
# registrable - login logout 
# rememberable - token cookies
# trackable - track ip , log de ips
# timeoutable - time-out
# validatable - validacao
# lockable - traca a conta com erro de senha 

# instalar devise por alteracao do arquivo ./seuprojeto/Gemfile
# acrescentar a gem entre linha 5 e a linha 24 do arquivo original
gem 'devise', '4.8.0'  #linha a ser inserida 

# Gemfile , no grupo -> group :development, :test do (ambiente de teste)
# substituir byebug por pry
gem 'pry' , '0.14.1'

#atualizar gems ( terminal ) 
bundle install 

# apos instalar a devise , rodar
# ira criar os componetes da devise ( trataiva de seguranca)
# sempre olhar a documentacao da gem 
# se travar -> spring stop
rails generate devise:install 

# excutar as instrucoes da devise que aparece no terminal - veja a seguir
# no arquivo ./config/environments/development.rb inserir a linha abaixo
# dentro da sessao -> Rails.application.configure do
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

# ajustar arquivo config/routes.rb
# inserir dentro do loop "do" 
root to: "home#index"

# inserir codigos html em app/views/layouts/application.html.erb
# dentro de body
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>


##########################################################################
# gerar modelos
# no diretorio do projeto

rails generate controller Home index
# create  app/controllers/home_controller.rb
# route  get 'home/index'
# invoke  erb
# create    app/views/home
# create    app/views/home/index.html.erb
# invoke  helper
# create    app/helpers/home_helper.rb
# invoke  assets
# invoke    scss
# create      app/assets/stylesheets/home.scss



rails generate devise User
# create    db/migrate/20210609235342_devise_create_users.rb
# create    app/models/user.rb
# insert    app/models/user.rb
# route  devise_for :users

# verificar as rotas criadas
rails routes | grep user

# criar no banco as tabelas da estrutura de usuario criada
rails db:create
# Created database 'DevEat_development'
# Created database 'DevEat_test'

rails db:migrate
# == 20210610003623 DeviseCreateUsers: migrating ================================
# -- create_table(:users)
#    -> 0.0144s
# -- add_index(:users, :email, {:unique=>true})
#    -> 0.0046s
# -- add_index(:users, :reset_password_token, {:unique=>true})
#    -> 0.0040s
# == 20210610003623 DeviseCreateUsers: migrated (0.0237s) =======================


#procura da pagina index
# app/controllers/views/home

# garregar o servidor - no diretorio do projeto 
rails server 
# => Booting Puma
# => Rails 6.1.3.2 application starting in development 
# => Run `bin/rails server --help` for more startup options
# Puma starting in single mode...
# * Puma version: 5.3.2 (ruby 2.7.0-p0) ("Sweetnighter")
# *  Min threads: 5
# *  Max threads: 5
# *  Environment: development
# *          PID: 23636
# * Listening on http://127.0.0.1:3000
# * Listening on http://[::1]:3000
# Use Ctrl-C to stop


# devise de assinatura e chamado
http://127.0.0.1:3000/users/sign_in/
# voce pode fazer o sigup e depois login 

# user -> fabiojpl@tudo.com
# pwd -> Teste2021
# Welcome! You have signed up successfully.

# projeto criado e estruturado usando opostgresql e devise
#siga proximo passo 
# 24_CRUD_Controllers_models_view