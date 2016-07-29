# encoding: utf-8

module Pages
	module QuestionHelpPage
		class << self
			# Elements
			def initialize()
			end
			def goback
				id('com.changhong.ssc.cookbook:id/ques_help_back')
			end
			def helpListView
				tag('android.widget.ListView')
				# id('com.changhong.ssc.cookbook:id/ques_help_lv')
			end
			def helpList
				self.helpListView.tag('android.widget.LinearLayout')
			end
		end
	end
end

module Kernel
	def questionHelpPage
		Pages::QuestionHelpPage
	end
end
