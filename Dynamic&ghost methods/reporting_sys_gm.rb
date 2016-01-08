# Ghost methods

require_relative('store')

class ReportingSystem

	def initialize
		@store = Store.new
	end

	def method_missing(name, *args)
		super unless @store.respond_to?(name)
		@store.send(name)
	end

end