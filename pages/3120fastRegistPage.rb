# encoding: utf-8

module Pages
	module FastRegistPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/registgoback')
			end
			def title
				id('com.changhong.ssc.cookbook:id/regist_title')
				# text_exact('注册')				
			end
			def phoneNum
				id('com.changhong.ssc.cookbook:id/registphonenum')
			end
			def identifyCode
				id('com.changhong.ssc.cookbook:id/identifying_input')
			end
			def get_indentifyCode_btn
				id('com.changhong.ssc.cookbook:id/identifying_btn')
			end
			def serviceRules_checkbox
				tag('android.widget.CheckBox')
			end
			def serviceRules
				text_exact('服务协议')
			end
			def next_btn
				id('com.changhong.ssc.cookbook:id/next_btn')
			end

			def regist(phoneNum=nil, identifyCode=nil)
				self.phoneNum.clear
				self.phoneNum.type phoneNum
				self.get_indentifyCode_btn.click if self.get_indentifyCode_btn.attribute('enabled') == 'true'
				self.identifyCode.clear
				self.identifyCode.type identifyCode
				self.next_btn.click if self.next_btn.attribute('enabled') == 'true'
			end
			def regist_without_btn_click(phoneNum=nil, identifyCode=nil)
				self.phoneNum.clear
				self.phoneNum.type phoneNum
				self.identifyCode.clear
				self.identifyCode.type identifyCode
			end
		end
	end
end

module Kernel
	def fastRegistPage
		Pages::FastRegistPage
	end
end
