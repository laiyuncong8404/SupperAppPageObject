# encoding: utf-8

module Pages
	module ServiceNetworkPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/after_sales_service_back')
			end
			def title
				id('com.changhong.ssc.cookbook:id/after_sales_service_title')
				# text_exact('服务网点')
			end
			# WebView
			def provinceName
				find_element(:css, "#provinceName > div > div")
			end
			def cityName
				find_element(:css, "#cityName > div > div")
			end
			def regionName
				find_element(:css, "#regionName > div > div")
			end
			def  devType
				find_element(:css, "#devType > div > div")
			end
			def maintenanceCenterNames
				find_elements(:class_name, "#support-type")
			end
			def maintenanceCenterAddresses
				find_elements(:class_name, "support-address")
			end

			def select_by_proviceName(provinceName)
				self.provinceName.click
				wait = Selenium::WebDriver::Wait.new(timeout: 120)
				provinceList = find_element(:css, '#provinceName > div > ul')
    			wait.until { provinceList.displayed? }
    			provice = provinceList.find_elements(:class_name, 'select-li').detect {|name| name.text == provinceName}
    			provice.click
    			sleep(2)
			end
			def select_by_cityName(cityName)
				self.cityName.click
				wait = Selenium::WebDriver::Wait.new(timeout: 120)
				cityList = find_element(:css, '#cityName > div > ul')
    			wait.until { cityList.displayed? }
    			city = cityList.find_elements(:class_name, 'select-li').detect {|name| name.text == cityName}
    			city.click
    			sleep(2)
			end
			def select_by_regionName(regionName)
				self.regionName.click
				wait = Selenium::WebDriver::Wait.new(timeout: 120)
				regionList = find_element(:css, '#regionName > div > ul')
    			wait.until { regionList.displayed? }
    			region = regionList.find_elements(:class_name, 'select-li').detect {|name| name.text == regionName}
    			region.click
    			sleep(2)
			end
			def select_by_devType(devType)
				self.devType.click
				wait = Selenium::WebDriver::Wait.new(timeout: 120)
				devTypeList = find_element(:css, '#devType > div > ul')
    			wait.until { devTypeList.displayed? }
    			devType = devTypeList.find_elements(:class_name, 'select-li').detect {|name| name.text == devType}
    			devType.click
    			sleep(2)
			end
		end
	end
end

module Kernel
	def serviceNetworkPage
		Pages::ServiceNetworkPage
	end
end
