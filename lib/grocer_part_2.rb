require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]
    if item_is_in_basket and count_is_big_enough_to_apply
      cart << { item: "#{item_with_coupon[:item]} W/COUPON", 
                price: coupon[:cost] / coupon[:num], 
                clearance: item_with_coupon[:clearance],
                count: coupon[:num]
              }
      item_with_coupon[:count] -= coupon[:num]
    end
  end
  cart
end


def apply_clearance(cart)
#binding.pry
  cart.map do |item|
    if item[:clearance]
      item[:price] *= 0.8
    end
    item
  end
end



def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)

  new_cart = apply_coupons(new_cart,coupons)
  
  new_cart = apply_clearance(new_cart)
  
  total = 0
  new_cart.each do |item|
   # binding.pry 
    total += item[:price] * item[:count]
  end
  total *= 0.9 if total > 100
  total.round(2)
end
