require './MyClass.rb'

class YourClass
	m = MyClass.new
	puts m
	def initialize
		puts "i am in yourclass"
	end

end

your = YourClass.new
