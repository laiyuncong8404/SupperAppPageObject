# encoding: utf-8

module Pages
	module ProductInfoPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/product_info_back')
			end
			def title
				id('com.changhong.ssc.cookbook:id/product_info_title')
			end

			# WebView
			def productInfo
				find_elements(:css, "body > p > img")
				# find_elements(:css, 'a[src^="http"]')#选择每一个src属性的值以"http"开头的元素
				# find_elements(:css, "a[src$='.png']")#选择每一个src属性的值以".png"结尾的元素
			end			
		end
	end
end

module Kernel
	def productInfoPage
		Pages::ProductInfoPage
	end
end
