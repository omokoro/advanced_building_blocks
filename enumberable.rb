module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in self 
			yield(self[i],i)
		end
	end

	def my_select
		return self unless block_given?
		arr = []
		self.my_each { |i| arr << i if yield(i) }
		arr
	end

	def my_all?(&block)
		block ||= Proc.new { |obj| obj}
		self.my_each { |i| return false unless block.call(i) }
		true
	end

	def my_any?(&block)
		block ||= Proc.new { |obj| obj }
		self.my_each { |i| return true if block.call(i) }
		false
	end

	def my_none?(&block)
		block ||= Proc.new { |obj| obj}
		self.my_each { |i| return false if block.call(i) }
		true
	end

	def my_count
		count = 0
		if block_given?
			self.my_each { |i| count+=1 if yield(i) }
		else
			self.my_each { |i| count+=1}
		end
		count
	end

	def my_map(proc=nil)
		arr = []
		if proc
			self.my_each { |i| arr << proc.call(i) }
			arr
		else
			self.my_each { |i| arr << yield(i)}
			arr
		end	
	end

	def my_inject(initial=nil)
		memo = initial.nil? ? self[0] : initial
		self.my_each { |i| memo = yield(memo, i)}
		memo
	end
end

def multiply_els(array)
	array.my_inject(1) { |total, element| total * element }

end
proc = Proc.new { |p| p +2 }
puts (1..4).my_map(proc) {|x| x*2}