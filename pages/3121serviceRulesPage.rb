# encoding: utf-8

module Pages
	module ServiceRulesPage
		class << self
			# Elements
			def initialize()
			end			
		end
	end
end

module Kernel
	def serviceRulesPage
		Pages::ServiceRulesPage
	end
end
