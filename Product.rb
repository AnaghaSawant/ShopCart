require './Category.rb'

class Product
	attr_reader :prod_id, :prod_name, :prod_description, :tax, :discount_percent, :selling_price, :cost_price
	attr_accessor :quantity

	def add_products_info

		puts "enter product id"
		@prod_id = gets.chomp.to_i

		puts "enter product name"
		@prod_name = gets.chomp

		puts "Cost price of product"
		@cost_price = gets.chomp.to_i

		puts "enter tax"
		@tax = gets.chomp.to_i

		puts "enter quantity"
		@quantity = gets.chomp.to_i
	end

	def set_discount
		puts "Enter discount percent"
		@discount_percent = gets.chomp.to_i
		puts "Discounted price of product"
		@discount = @cost_price * @discount_percent / 100
		puts @discount
	end

	def calculate_selling_price
		puts "Selling price"
		@selling_price = @cost_price - @discount + @tax
		puts @selling_price
	end
end
