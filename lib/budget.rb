require './lib/department'
require './lib/employee'

class Budget
	attr_reader :year, :departments

	def initialize(info)
		@year = info[:year]
		@departments = info[:departments]
	end

end