class User < ApplicationRecord
  has_secure_password
# has_one :order

# def current_cart
#   if self.cart.empty?
#     self.cart.create!
#   end
#   self.cart
# end

end
