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
  # code here
  if coupons.length == 0
    return cart
  else

    coupons.each do |coupon|
      name = coupon[:item]
      item = cart[name]

      if(item != nil)
        if(item[:count] >= coupon[:num])
          item[:count] = item[:count] - coupon[:num]
          coupon_name = "#{name} W/COUPON"
          if(cart[discount_name] == nil)
            coupon_item = {:price => index[:cost], :clearance => item[:clearance], :count => 1}
            cart[coupon_name] = coupon_item
          else
            coupon_item = cart[couponkey];
            coupon_item[:count] +=1;
          end
        end
      end
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

def checkout(cart, coupons)
  
end
