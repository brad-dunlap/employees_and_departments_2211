class Employee
	attr_reader :name, :age, :salary
	attr_accessor :responsible_expenses

	def initialize(info)
		@name = info[:name]
		@age = info[:age].to_i
		@salary = info[:salary].tr('$', '').to_i
		@responsible_expenses = Hash.new{|k,v| v = []}
	end

	def give_raise(raise)
		@salary += raise
	end

	def total_expenses_responsible
		sum = 0
		@responsible_expenses.each do |k,v|
			sum += v
		end
		sum
	end
end