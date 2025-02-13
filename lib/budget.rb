require './lib/department'
require './lib/employee'

class Budget
	attr_reader :year, :departments

	def initialize(year)
		@year = year
		@departments = []
	end

	def add_department(dept)
		@departments << dept
	end

	def departments_with_expenses_under_500
		@departments.find_all do |dept|
			dept.expenses <500
		end
	end

	def employee_salaries
		hash = {}
		@departments.each do |dept|
			dept.employees.each do |emp|
				hash[emp.name] = emp.salary			
			end
		end
		hash
	end
end