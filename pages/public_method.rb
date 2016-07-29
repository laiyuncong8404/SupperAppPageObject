# encoding: utf-8

def back_click
  press_keycode(4) #手机BACK键
end

def home_click
  press_keycode(3) #手机HOME键
end

def menu_click
  press_keycode(1) #手机MENU键
end

def onProgress()
  sleep 3
  exists{tag('android.widget.ProgressBar')}? onProgress() : (sleep 5)
end
def onLoading()
  sleep 3
  exists{text('正在加载')}? onLoading() : (sleep 5)
end
