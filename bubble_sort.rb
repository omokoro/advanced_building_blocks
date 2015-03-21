def bubble_sort(numbers)
	sorted = false 
	until sorted
		sorted = true
		for i in 1..numbers.length-1
			if numbers[i-1] > numbers[i]
				temp = numbers[i]
				numbers[i-1], numbers[i] = numbers[i], numbers[i-1]
				sorted = false
			end
			
		end
	end
	p numbers
end

bubble_sort([4,3,78,2,0,2])
