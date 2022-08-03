FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    unit_price { 19.99 }
    total { 100 }
    product
    order
  end
end
