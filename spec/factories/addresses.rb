# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    name { "Rua Andrelino de Souza" }
    neighborhood { "Jardim Maria Antônia Prado" }
    city { "Sorocaba" }
    state { "SP" }
    zipcode { "18076000" }
  end
end
