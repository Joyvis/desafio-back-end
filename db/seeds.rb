# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

transaction_types = [
  { name: 'Débito', direction: :in, type_external_id: 1},
  { name: 'Boleto', direction: :out, type_external_id: 2},
  { name: 'Financiamento', direction: :out, type_external_id: 3},
  { name: 'Crédito', direction: :in, type_external_id: 4},
  { name: 'Recebimento Empréstimo', direction: :in, type_external_id: 5},
  { name: 'Vendas', direction: :in, type_external_id: 6},
  { name: 'Recebimento TED', direction: :in, type_external_id: 7},
  { name: 'Recebimento DOC', direction: :in, type_external_id: 8},
  { name: 'Aluguel', direction: :out, type_external_id: 9}
]

TransactionType.create(transaction_types)

puts 'Transaction Types seeded'
