# Dynamic methods.

require_relative 'store'

class ReportingSystem

	def initialize
		@store = Store.new
		@store.methods.grep(/^get_(.*)_[desc,price]/) do
			ReportingSystem.define_report_methods_for($1)
		end
	end

	def self.define_report_methods_for(item)
		define_method("get_#{item}_desc") do 
			@store.send("get_#{item}_desc")
		end

		define_method("get_#{item}_price") do
			@store.send("get_#{item}_price")
		end
	end

end