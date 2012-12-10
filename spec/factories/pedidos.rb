# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pedido do
    producto_id 1
    vendedor_id 1
    empresa_id 1
    cantidad 1
  end
end
