# encoding: utf-8

module Pages
	module ResetpswdPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/registgoback')
			end
			def title
				id('com.changhong.ssc.cookbook:id/regist')
				#text_exact('修改密码')
			end
			def save
				id('com.changhong.ssc.cookbook:id/finish_btn')
				# text_exact('保存')
			end
			def oldpswd_EditText
				id('com.changhong.ssc.cookbook:id/reset_old')
			end
			def newpswd_EditText
				id('com.changhong.ssc.cookbook:id/reset_new')
			end
			def newpswd_repeat_EditText
				id('com.changhong.ssc.cookbook:id/reset_new_repeat')
			end

			def reset_pswd(oldpswd=nil, newpswd=nil, newpswd_repeat=nil)
				clearText(self.oldpswd_EditText)
				self.oldpswd_EditText.type oldpswd
				clearText(self.newpswd_EditText)
				self.newpswd_EditText.type newpswd
				clearText(self.newpswd_repeat_EditText)
				self.newpswd_repeat_EditText.type newpswd_repeat
				self.save.click
			end
			def reset_pswd_without_save(oldpswd=nil, newpswd=nil, newpswd_repeat=nil)
				clearText(self.oldpswd_EditText)
				self.oldpswd_EditText.type oldpswd
				clearText(self.newpswd_EditText)
				self.newpswd_EditText.type newpswd
				clearText(self.newpswd_repeat_EditText)
				self.newpswd_repeat_EditText.type newpswd_repeat
			end
			def clearText(element) #使用于清除内容失效的时候
				element.clear
				length = (element.text).length
				length.times do
					press_keycode(22)
				end
				length.times do
					press_keycode(67)
				end
			end
		end
	end
end

module Kernel
	def resetpswdPage
		Pages::ResetpswdPage
	end
end
