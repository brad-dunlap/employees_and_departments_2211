require './lib/employee'
require './lib/department'

RSpec.describe Department do
		let(:customer_service) { Department.new("Customer Service") }
		let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
		let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
	
	describe '#initialize' do
		it 'exists' do
			expect(customer_service).to be_instance_of(Department)
		end

		it 'has attributes' do
			expect(customer_service.name).to eq("Customer Service")
			expect(customer_service.employees).to eq([])
		end
	end

	describe '#hire' do
		it 'adds employees to departments when hired' do
			customer_service.hire(bobbi)
			customer_service.hire(aaron)
			expect(customer_service.employees).to eq([bobbi, aaron])
		end
	end

	describe '#expenses' do
		it 'can add expenses to a department' do
			customer_service.expense(100, "refund", bobbi)
			customer_service.expense(25, "paper", aaron)
			expect(customer_service.expenses).to eq(125)
		end

		it 'can make someone responsible for expense' do
			customer_service.expense(100, "refund", bobbi)
			customer_service.expense(25, "paper", aaron)
			customer_service.expense(50, "bills", aaron)
			expect(bobbi.responsible_expenses).to eq("refund" => 100)
			expect(aaron.responsible_expenses).to eq("paper" => 25, "bills" => 50)
		end
	end

	describe '#total_expense_responsible' do
		it 'can sum all expenses for one employee' do
			customer_service.expense(100, "refund", bobbi)
			customer_service.expense(200, "theft", bobbi)
			customer_service.expense(25, "paper", aaron)
			customer_service.expense(50, "bills", aaron)
			expect(aaron.total_expenses_responsible).to eq(75)
			expect(bobbi.total_expenses_responsible).to eq(300)
		end
	end
end