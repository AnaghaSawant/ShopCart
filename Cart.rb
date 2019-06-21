require './Category.rb'
require './Shop.rb'
require 'byebug'
require 'csv'
class Cart
	
	def initialize
		@wish_list = []
	end

	def add_product_to_wish_list(shop_object)
		read_csv = CSV.open("wishlist.csv","r+")
		read_csv << ["product_id","product_name","cost_price","tax","discount_percent","selling_price","quantity"]
		read_csv.close
		more = true
		while more == true
			data = []
			CSV.foreach("MainProductlist.csv", headers: true) do |row|
	  			data << row.to_hash
			end
			puts data

			puts "enter your choice:"
			c = gets.chomp.to_i

			if data.empty?
				puts "no products are available"
			else
				selected_product = data.at(c-1)
				puts selected_product
				if(selected_product["quantity"] == 0)
					puts "empty"
					break
				else
					# byebug
					temp_product = selected_product.clone
					puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
					puts "#{temp_product['product_id']}\t\t#{temp_product['product_name']}\t#{temp_product['cost_price']}\t#{temp_product['tax']}\t\t#{temp_product['discount_percent']}\t\t#{temp_product['selling_price']}\t\t#{temp_product['quantity']}"
					puts "enter quantity you want"
					qty = gets.chomp.to_i
					temp_product["quantity"] = qty
					left_product = selected_product["quantity"].to_i - temp_product["quantity"].to_i  
			        selected_product["quantity"] = left_product.to_s
# =======================================================================================================================================================================================================================================================================
			        puts data

					CSV.open("MainProductlist.csv", "w+") do |csv|
						data.each do |i|
							csv << [i['product_id'],i['product_name'],i['cost_price'],i['tax'],i['discount_percent'],i['selling_price'],i['quantity']]
						end
					end			        
# ========================================================================================================================================================================================================================================================================
			        # update_csv.close()
			        puts "Left item: #{selected_product["quantity"]}\n"
					puts "Do u want to continue with other categories : Type c or n"
		        	c = gets.chomp
					@wish_list << temp_product
	
					if c!= "c"
			            more = false
			            CSV.open("wishlist.csv", "a+") do |csv|
							@wish_list.each do |i|
								csv << [i['product_id'],i['product_name'],i['cost_price'],i['tax'],i['discount_percent'],i['selling_price'],i['quantity']]
							end
						end
			        end
			    end	
		    end
		end
	end

	def show_wish_list
		puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
		@wish_list.each do |i|
			puts "#{i['product_id']}\t\t#{i['product_name']}\t\t#{i['cost_price']}\t\t#{i['tax']}\t\t#{i['discount_percent']}\t\t#{i['selling_price']}\t\t#{i['quantity']}"
		end
	end

	def remove_product_from_wish_list
		more = true
		while more == true
			puts "Select product to remove"
			item = gets.chomp.to_i
			remove_product = @wish_list.delete_at(item-1)
			puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
			puts "#{remove_product['product_id']}\t\t#{remove_product['product_name']}\t\t#{remove_product['cost_price']}\t\t#{remove_product['tax']}\t\t#{remove_product['discount_percent']}\t\t#{remove_product['selling_price']}\t\t#{remove_product['quantity']}"
			puts "Do you want to remove more product : Type c or n"
			c = gets.chomp.to_i
			if c!= "c"
	            more = false
	        end
	    end
	end

	def check_out
		@total = 0
        puts "product_id"+"\t"+"product_name"+"\t"+"cost_price"+"\t"+"tax"+"\t"+"discount_percent"+"\t"+"selling_price"+"\t"+"quantity"
        @wish_list.each do |i| 
			puts "#{i['product_id']}\t\t#{i['product_name']}\t\t#{i['cost_price']}\t\t#{i['tax']}\t\t#{i['discount_percent']}\t\t#{i['selling_price']}\t\t#{i['quantity']}"
			@QintoP =  i['selling_price'].to_i * i['quantity'].to_i
            @total = @total + @QintoP
        end
        puts "-----------------------------------------------------------------------------------------------"
        puts "total : #{@total}"
	end
end
