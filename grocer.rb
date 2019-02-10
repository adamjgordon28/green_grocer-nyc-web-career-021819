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
    # add coupon to cart
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
      hash[item][:count] -= coupon[:num]
    end
  end
  hash
end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if cart[item][:clearance] == true 
      cart[item][:price] = (cart[item][:price]*(0.8)).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  
end
