require_relative './Cart.rb'
require_relative './Shop.rb'

class UserInterface
	attr_reader :shop, :cart
	
	def initialize
		@shop = Shop.new
		@cart = Cart.new
	end

	def main_menu
		action = true
		while action == true
			puts "\n 1. Display allcategories\n 2. Add product to Main productList\n 3. Dispaly main productlist\n 4. Remove product from main list\n 5. Add product to wish list\n 6.Remove product from wish_list\n 7. Dispaly selected product\n 8. Make bill of purchased product\n 9. Exit"
            puts "\nEnter your choice:"
            x = gets.to_i
            case x

	            when 1
	            	@shop.all_categories
	        	 when 2
	        	 	@shop.add_product_to_main_list 
	        	 when 3
	        	 	@shop.display_main_product_list
	        	 when 4
	        	 	 @shop.remove_from_main_product_list
	        	 when 5
	        	 	@cart.add_product_to_wish_list(shop)
	        	 when 6
	        	 	@cart.remove_product_from_wish_list
	        	 when 7
	        	 	@cart.show_wish_list
	        	 when 8
	        	 	@cart.check_out
        		else
        			break
        	end
		end
	end
end

user = UserInterface.new
user.main_menu
