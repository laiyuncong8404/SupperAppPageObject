# encoding: utf-8

module Pages
	module ProductUserbookPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/product_specification_back')
			end
			def title
				id('com.changhong.ssc.cookbook:id/product_specification_title')
				# text_exact('产品说明书')
			end

			# ListView
			def productList
				id('com.changhong.ssc.cookbook:id/product_specification_lv')
				#tag('android.widget.ListView')
			end
		end
	end
end

module Kernel
	def productUserbookPage
		Pages::ProductUserbookPage
	end
end
