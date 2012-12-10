# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :producto do
    nombre "MyString"
    precio 1
    descripcion "MyText"
  end
end
