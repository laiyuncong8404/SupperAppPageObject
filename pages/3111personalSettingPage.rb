# encoding: utf-8

module Pages
	module PersonalSettingPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/registgoback')
			end
			def title
				text_exact('个人设置')
				#id('com.changhong.ssc.cookbook:id/regist')
			end
			def protraitsetting
				id('com.changhong.ssc.cookbook:id/protraitsetting')
				#text_exact('头像')
			end
			def nickname
				id('com.changhong.ssc.cookbook:id/nickname')
				#text_exact('昵称')
			end
			def resetpswd
				id('com.changhong.ssc.cookbook:id/resetpsw')
				# text_exact('密码修改')
			end
			def quit
				id('com.changhong.ssc.cookbook:id/quit')
			end
		end
	end
end

module Kernel
	def personalSettingPage
		Pages::PersonalSettingPage
	end
end
