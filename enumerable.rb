module Enumerable
	def my_each
		return self unless block_given?
		for item in self do
			yield item
		end
	end
	
	def my_each_with_index
		return self unless block_given?
		for item in 0...self.size do
			yield( self[item], item )
		end
	end
	
	def my_select
		results = []
		if block_given?
			self.my_each {|item| results << item if yield(item)}
			return results
		end
		return self.to_enum
	end
	
	def my_all?
		if block_given?
			self.my_each {|item| return false unless yield(item)}
		else
			self.my_each {|item| return false unless item}
		end
		return true
	end
	
	def my_any?
		if block_given?
			self.my_each {|item| return true if yield(item)}
		else
			self.my_each {|item| return true if item}
		end
		return false
	end
	
	def my_none?
		if block_given?
			self.my_each {|item| return false if yield(item)}
		else
			self.my_each {|item| return false if item}
		end
		return true
	end
	
	def my_count(value = nil)
		the_count = 0
		if block_given?
			self.my_each {|item| the_count += 1 if yield(item)}
		elsif (value != nil)
			self.my_each {|item| the_count += 1 if item == value}
		else
			self.my_each {|item| the_count += 1}
		end
		return the_count
	end
	
	def my_map
		result = []
		if block_given?
			self.my_each {|item| result << yield(item)}
		else
			result = self.to_enum
		end
		return result
	end
	
	def my_inject(number = nil)
		accumulator = number.nil? ? first : number
		my_each {|item| accumulator = yield(accumulator, item)}
		return accumulator
	end
end	

def multiply_els(input_array)
	return input_array.my_inject(1) {|product, x| product * x}
end
	
# Tests multiply_els
# puts multiply_els([2,4,5])