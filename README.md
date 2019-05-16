# CNAB DATA IMPORTER

Serviço destino para leitura e importação de transações via arquivo CNAB

## Como utilizar

Após clonar o projeto na pasta de sua preferência, acesse a pasta raiz do projeto e execute os seguintes comandos:
<pre>
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
</pre>

Após o procedimento ser concluído, basta acessar o endereço `` http://localhost:3000/transactions `` através do seu navegador.
