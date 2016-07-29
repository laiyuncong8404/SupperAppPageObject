# encoding: utf-8

module Pages
	module HomePage
		class << self
			# Elements
			def devices_list
				$driver.find_element(:id, "com.changhong.ssc.cookbook:id/devices_list")
			end
			def health_living
				health_living = id("com.changhong.ssc.cookbook:id/health_living")
			end
			def personal_center
				id("com.changhong.ssc.cookbook:id/personal_center")
			end
		end
	end
end

module Kernel
	def homePage
		Pages::HomePage
	end
end
