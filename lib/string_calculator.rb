class StringCalculator

	def add string_number 
		numbers = replace(string_number)
		fail "Negatives not allowed: #{negative_return(numbers)}" if !all_positive? numbers 
		0 if numbers.nil?
		sum(numbers)
	end

	private

	def sum(nums)
		total = 0
		nums.each {|num| total += num.to_i} 
		total
	end

	def replace(string)
		ignore_large(string.gsub(/[^0-9-]/i,',').split(",").reject(&:empty?))
	end

	def negative_return nums
		negatives = ""
		nums.each { |num| negatives << "#{num}," if negative? num }
		negatives.chomp(',')
	end

	def all_positive? nums
		true if nums.each { |num| return false if negative? num }
	end

	def negative? num
		num.to_i < 0
	end

	def ignore_large numbers
		small_nums = []
		numbers.each { |num|  small_nums << num if num.to_i < 1000}
		small_nums
	end
end






