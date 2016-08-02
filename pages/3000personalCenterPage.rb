# encoding: utf-8

module Pages
	module PersonalCenterPage
		class << self
			def initialize()
			end
			# Elements
			def title
				id('com.changhong.ssc.cookbook:id/label')
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
			def msgcenter
				id('com.changhong.ssc.cookbook:id/msg_center')
				# text_exact('消息中心')
			end
			def customer
				id('com.changhong.ssc.cookbook:id/customer_center')
				# text_exact('客服中心')
			end
			def productUserbook
				id('com.changhong.ssc.cookbook:id/menu_center')
				# text_exact('产品说明书')
			end
			def update
				id('com.changhong.ssc.cookbook:id/updata_center')
				# text_exact('软件更新')
			end
		end
	end
end

module Kernel
	def personalCenterPage
		Pages::PersonalCenterPage
	end
end
