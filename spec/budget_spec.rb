require 'pry'
require 'rspec'
require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
		let(:customer_service) { Department.new("Customer Service") }
		let(:mens) { Department.new("Mens") }
		let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
		let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
		let(:budget) { Budget.new({year: 2022, departments: [customer_service, mens]})}
	
	describe '#initialize' do
		it 'exists' do
			expect(budget).to be_instance_of(Budget)
		end

		it 'has attributes' do
			expect(budget.year).to eq(2022)
			expect(budget.departments).to eq([customer_service, mens])
		end
	end

	describe '#departments_with_expenses_under_500' do
		it 'can list departments with expenses under $500' do
			customer_service.expense(100)
			customer_service.expense(25)
			mens.expense(499)
			expect(budget.departments_with_expenses_under_500).to eq([customer_service, mens])
			mens.expense(10)
			expect(budget.departments_with_expenses_under_500).to eq([customer_service])
		end
	end

	describe '#employee_salaries' do
		it 'can list all employee salaries' do
			customer_service.hire(bobbi)
			customer_service.hire(aaron)
			expect(budget.employee_salaries).to eq({"Bobbi Jaeger" => 100000, "Aaron Tanaka" => 90000})
		end
	end
end
