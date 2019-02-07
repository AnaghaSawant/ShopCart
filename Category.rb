class Category
	attr_reader :cat_id, :cat_name, :products
	attr_writer :cat_id, :cat_name, :products

	def add_category
		puts "category id :"
		@cat_id = gets.chomp.to_i
		puts "category name"
		@cat_name = gets.chomp
		@products = []
	end
end