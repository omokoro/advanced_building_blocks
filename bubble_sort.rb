def bubble_sort(numbers)
	sorted = false 
	until sorted
		sorted = true
		for i in 1..numbers.length-1
			if numbers[i-1] > numbers[i]
				numbers[i-1], numbers[i] = numbers[i], numbers[i-1]
				sorted = false
			end
		end
	end
	numbers
end

def bubble_sort_by(array)
	sorted = false 
	until sorted
		sorted = true
		for i in 1..array.length-1
			if yield(array[i-1], array[i]) < 0
				array[i-1], array[i] = array[i], array[i-1]
				sorted = false
			end
		end
	end
	array
end


p bubble_sort([4,3,78,2,0,2])

p bubble_sort_by(["hi","hello","hey"]) { |l, r| r.length - l.length }

