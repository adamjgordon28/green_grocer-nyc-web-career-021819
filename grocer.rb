require "pry"

def consolidate_cart(cart)
  new_cart = {}
 cart.uniq.each do |unique_item|
   count = 0 
   cart.each do |item|
     if unique_item == item
       count +=1
     end
   end
   unique_item.each do |name, info|
     new_cart[name] = info
     new_cart[name][:count] = count
   end
  end
 new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if !cart[item].nil? && cart[item][:count] >= coupon[:num]
      new_hash = {"#{item} W/COUPON" => {
        :price => coupon[:cost],
        :clearance => cart[item][:clearance],
        :count => 1
        }
      }
      if cart["#{item} W/COUPON"].nil?
        cart.merge!(new_hash)
      else
        cart["#{item} W/COUPON"][:count] += 1
      end
      cart[item][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if cart[item][:clearance] == true 
      cart[item][:price] = (cart[item][:price]*(0.8)).round(2)
    end
  end
  cart
end

def checkout(items, coupons)
  cart = consolidate_cart(items)
  cart1 = apply_coupons(cart, coupons)
  cart2 = apply_clearance(cart1)
  
  total = 0
  
  cart2.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end
  
  if total > 100
    total = total * (0.9)
  end
  total
end