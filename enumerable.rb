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

end	