require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart={}
  #binding.pry
  cart.each do |food, value|
    coupons.each do |coupon|
      binding.pry 
      if food == coupon[:item] && value[:count] >= coupon[:num]
        value[:count] = value[:count] - coupon[:num]
        if cart["#{food} W/COUPON"]
          result["#{food} W/COUPON"]
        else 
          cart["#{food} W/COUPON"] = [:price => coupon[:cost], :clearance => info[:clearance], :count => 1]
        end
      end
    end
    cart[food]=value
  end
  cart
end


#apply coupons
 # iterate through cart
 # iterate through coupons
#  find matches and add "W/COUPON"
#  divide price by the number of coupons
#  add regular and coupon items to an array 
#  return array 
  

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart,coupons)
  cart = apply_clearance(cart)
  cart.each do |food, info|
    result += (info[:price] * info[:count]).to_f
  end
  result > 100 ? result * 0.9 : result
end
