# encoding: utf-8

module Pages
	module MsgCenterPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/msg_center_back')
			end
			def title
				text_exact('消息中心')
			end
			def clear_all
				id('com.changhong.ssc.cookbook:id/clear_all')
			end
			def readed
				id('com.changhong.ssc.cookbook:id/switch_btn_read')
			end
			def unread
				id('com.changhong.ssc.cookbook:id/switch_btn_no_read')
			end
		end
	end
end

module Kernel
	def msgCenterPage
		Pages::MsgCenterPage
	end
end
