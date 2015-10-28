require 'string_calculator'

describe StringCalculator do

	subject(:string_calculator) {described_class.new}

	context '#add' do
		it 'returns 0 if an empty string is supplied' do
			expect(string_calculator.add("")).to eq 0
		end
		it 'return the users number if there is one number in string' do
			expect(string_calculator.add("4")).to eq 4
		end
		it 'returns the sum of the users number if two numbers are in the string' do
			expect(string_calculator.add("5,6")).to eq 11
		end
		it 'returns the sum of the users number more than two numbers are in the string' do
			expect(string_calculator.add("4,6,5,3,4,5")).to eq 27
		end
		it 'raises an error if a negative number is input' do
			expect(string_calculator.add("-5")).to raise_error('Negatives not allowed: -5')
		end
		it 'ignores numbers bigger than 1000' do
			expect(string_calculator.add("1005,6")).to eq 6
		end
		it 'removes all delimeters' do
			expect(string_calculator.add("//[*][%]\n1*2%3")).to eq 6
		end
	end
end

