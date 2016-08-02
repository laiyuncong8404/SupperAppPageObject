# encoding: utf-8

module Pages
	module ProtraitsettingPage
		class << self
			# Elements
			def initialize()
			end
			def take_photo_btn
				id('com.changhong.ssc.cookbook:id/btn_take_photo')
				#text_exact('拍照')
			end
			def pick_photo_btn
				id('com.changhong.ssc.cookbook:id/btn_pick_photo')
				#text_exact('从手机相册选择')
			end
			def cancel_btn
				id('com.changhong.ssc.cookbook:id/btn_cancel')
				# text_exact('取消')
			end
		end
	end
end

module Kernel
	def protraitsettingPage
		Pages::ProtraitsettingPage
	end
end
