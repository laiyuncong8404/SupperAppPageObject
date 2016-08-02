# encoding: utf-8

def back_click
	press_keycode(4) #手机BACK键
end

def home_click
	press_keycode(3) #手机HOME键
end

def menu_click
	press_keycode(82) #手机MENU键
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

def onProgress()
	sleep 3
	exists{tag('android.widget.ProgressBar')}? onProgress() : (sleep 5)
end
def onLoading()
	sleep 3
	exists{text('正在')}? onLoading() : (sleep 5)
end
