# encoding: utf-8
# require_relative '3000personalCenterPage' 

module Pages
	module AboutPage
		class << self
			# Elements
			def initialize()
				# personalCenterPage.setview.click
			end
			def goback
				id('com.changhong.ssc.cookbook:id/registgoback')
			end
			def title
				text_exact('关于')
			end
			def version
				id('com.changhong.ssc.cookbook:id/version')
			end
			def QR_Code
				tag('android.widget.ImageView')[2]
			end
		end
	end
end

module Kernel
	def aboutPage
		Pages::AboutPage
	end
end
