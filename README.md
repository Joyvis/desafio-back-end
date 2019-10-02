# CNAB DATA IMPORTER

Serviço destino para leitura e importação de transações via arquivo CNAB

## Como Rodar a Aplicação

Após clonar o projeto na pasta de sua preferência, acesse a pasta raiz do projeto e execute os seguintes comandos:
<pre>
cp .env.development .env
docker-compose up -d
</pre>

Após o procedimento ser concluído, basta acessar o endereço `` http://localhost:3000/transactions `` através do seu navegador.

## Testando

Para rodar os testes da aplicação, execute o passo anterior e em seguida execute o seguinte comando:
<pre>
docker-compose exec railsapp rspec spec
</pre>


