require './lib/employee'
class Department
	attr_reader :name, :employees, :expenses

	def initialize(name)
		@name = name
		@employees = []
		@expenses = 0
	end

	def hire(employee)
		@employees << employee
	end

	def expense(amount, item, person_responsible)
		@expenses += amount		
		person_responsible.responsible_expenses[item] = amount
		end
end