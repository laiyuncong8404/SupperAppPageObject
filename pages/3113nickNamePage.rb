# encoding: utf-8

module Pages
	module NickNamePage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/registgobackarea1')
			end
			def title
				id('com.changhong.ssc.cookbook:id/regist')
				#text_exact('昵称')
			end
			def save
				id('com.changhong.ssc.cookbook:id/save')
				# text_exact('保存')
			end
			def remove
				id('com.changhong.ssc.cookbook:id/remove')
			end
			def nickname_EditText
				id('com.changhong.ssc.cookbook:id/reset_old')
			end

			def reset_nickname(nickname)
				self.remove.click
				self.nickname_EditText.type nickname
				self.save.click
			end
		end
	end
end

module Kernel
	def nickNamePage
		Pages::NickNamePage
	end
end
