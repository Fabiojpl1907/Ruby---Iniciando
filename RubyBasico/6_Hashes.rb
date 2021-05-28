# EStrutura de chave-valor
# permite acessar um valor por pesquisa

# inicializando

hash = {}
hash = Hash.new

# chaves e valores podem ser de qualuer tipo
# chave => valor

h = { "nome" => "Fabio", "idade" => 60}

# economizando memoria
h = { :nome => "Fabio",  :idade => 60}
h = { nome: "Fabio", idade: 60}

# acessar valor do hash
h[:nome]

#alterar nome
h[:nome] = "Novo nome"

#inserir um novo valor no hash
h[:novo] = "Novo valor"

#metodos uteis
h.keys
h.values
h.empty?
h.class