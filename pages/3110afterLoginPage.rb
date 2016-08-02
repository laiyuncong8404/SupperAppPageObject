# encoding: utf-8

module Pages
	module AfterLoginPage
		class << self
			# Elements
			def initialize()
			end
			def title
				text_exact('个人中心')
			end
			def setview
				id('com.changhong.ssc.cookbook:id/setview')
			end
			def protrait
				id('com.changhong.ssc.cookbook:id/protrait')
			end
			def username
				id('com.changhong.ssc.cookbook:id/username')
			end
			def home_location
				id('com.changhong.ssc.cookbook:id/home_location')
			end
			def msgcenter
				text_exact('消息中心')
			end
			def customer
				text_exact('客服中心')
			end
			def userbook
				text_exact('产品说明书')
			end
			def update
				text_exact('软件更新')
			end
		end
	end
end

module Kernel
	def afterLoginPage
		Pages::AfterLoginPage
	end
end
