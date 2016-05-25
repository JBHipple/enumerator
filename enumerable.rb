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
		true
	end
end	