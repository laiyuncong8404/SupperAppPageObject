# encoding: utf-8

module Pages
	module CustomerServiceCenterPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/customer_service_back')
			end
			def title
				text_exact('客服中心')
				#id('com.changhong.ssc.cookbook:id/customer_service_title')
			end
			def questionHelp
				text_exact('常见问题帮助')
			end
			def serviceNetwork
				text_exact('服务网点')
			end
			def onlineConsult
				text_exact('在线咨询')
			end
		end
	end
end

module Kernel
	def customerServiceCenterPage
		Pages::CustomerServiceCenterPage
	end
end
