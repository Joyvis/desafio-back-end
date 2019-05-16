# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { 'Cliente Nome' }
    store_name { 'Nome Loja Cliente' }
    identification_document { '123456789' }
  end
end
