require 'pry'
require 'rspec'
require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do
		let(:customer_service) { Department.new("Customer Service") }
		let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
		let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
		let(:budget) { Budget.new({year: 2022, departments: customer_service})}
	
	describe '#initialize' do
		it 'exists' do
			expect(budget).to be_instance_of(Budget)
		end

		it 'has attributes' do
			expect(budget.year).to eq(2022)
			expect(budget.departments).to eq([customer_service])
		end
	end