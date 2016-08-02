# encoding: utf-8
# require_relative '3000personalCenterPage' 

module Pages
	module LoginPage
		class << self
			# Elements
			def initialize()
				# personalCenterPage.protrait.click
			end
			def goback
				id('com.changhong.ssc.cookbook:id/imageView1')
			end
			def title
				id('com.changhong.ssc.cookbook:id/title')
			end
			def username_EditText
				id('com.changhong.ssc.cookbook:id/username')
			end
			def password_EditText
				id('com.changhong.ssc.cookbook:id/pswd')
			end
			def rememberpswd_CheckBox
				id('com.changhong.ssc.cookbook:id/showpassword')
			end
			def autologin_CheckBox
				id('com.changhong.ssc.cookbook:id/autologin')
			end
			def login_btn
				id('com.changhong.ssc.cookbook:id/login_btn')
			end
			def forget_pswd_TextView
				id('com.changhong.ssc.cookbook:id/login_forget_pswd')
			end
			def fastRegist_TextView
				id('com.changhong.ssc.cookbook:id/fastRegist')
			end			

			def input_username_and_password(username, password)
				self.username_EditText.clear
				self.username_EditText.type username
				self.password_EditText.clear
				self.password_EditText.type password
			end

			def login(username=nil, password=nil)
				input_username_and_password(username, password)
				self.login_btn.click
			end
			def login_with_password_remember(username=nil, password=nil)
				input_username_and_password(username, password)
				self.rememberpswd_CheckBox.click if self.rememberpswd_CheckBox.attribute('checked')!=true
				self.login_btn.click
			end
			def login_with_autologin(username=nil, password=nil)
				input_username_and_password(username, password)
				self.autologin_CheckBox.click if self.autologin_CheckBox.attribute('checked')!=true
				self.login_btn.click
			end
		end
	end
end

module Kernel
	def loginPage
		Pages::LoginPage
	end
end
