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
end	