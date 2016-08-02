# encoding: utf-8
require_relative "requires"

describe 'Devices_list page', :skip => false do
	before :all do
		homePage.devices_list.click
	end
	it 'Devices_list page elements check' do
		expect(homePage.devices_list.text).to eq('设备控制')
	end
end #Health_living page
describe 'Health_living page', :skip => false do
	before :all do
		homePage.health_living.click
	end
	it 'devices list page elements check' do
		expect(homePage.health_living.text).to eq('健康生活')
		expect(find_exact('健康生活').displayed?).to be true
		expect(find('食品管理').displayed?).to be true
		expect(finds('更多')[0].displayed?).to be true
		expect(find('智能配菜').displayed?).to be true
		expect(find('我的菜谱').displayed?).to be true
		expect(find('购食汇').displayed?).to be true
		expect(find('菜篮子').displayed?).to be true
	end
end #Health_living page
describe "personalCenterPage" do
	before :all do
		homePage.personal_center.click
	end
	it 'personal_center page elements check' do
		expect(personalCenterPage.title.text).to eq('个人中心')
		expect(personalCenterPage.setview.displayed?).to be true
		expect(personalCenterPage.protrait.displayed?).to be true
		expect(personalCenterPage.username.displayed?).to be true
		expect(personalCenterPage.msgcenter.displayed?).to be true
		expect(personalCenterPage.customer.displayed?).to be true
		expect(personalCenterPage.productUserbook.displayed?).to be true
		expect(personalCenterPage.update.displayed?).to be true
	end
	context "Login page", :skip =>false do
		before :all do
			personalCenterPage.username.click
		end
		it 'goback button can work' do
			begin
				loginPage.goback.click
				expect(personalCenterPage.username.displayed?).to be true
			ensure
				personalCenterPage.username.click
			end
		end
		it 'login without username and password' do
			loginPage.login(nil, nil)
			expect(loginPage.login_btn.displayed?).to be true
		end
		it 'login without username' do
			loginPage.login(nil, $data['right_password'])
			expect(loginPage.login_btn.displayed?).to be true
		end
		it 'login without password' do
			loginPage.login($data['registed_phoneNum'], nil)
			expect(loginPage.login_btn.displayed?).to be true
		end
		it 'login with unregisted_phoneNum and right_password' do
			loginPage.login($data['unregisted_phoneNum'], $data['right_password'])
			expect(loginPage.login_btn.displayed?).to be true
		end
		it 'login with registed_phoneNum and wrong_password' do
			loginPage.login($data['registed_phoneNum'], $data['wrong_password'])
			expect(loginPage.login_btn.displayed?).to be true
		end
		it 'login with right_phoneNum and right_password' do
			begin
				loginPage.login($data['right_phoneNum'], $data['right_password'])
				expect(personalCenterPage.username.text).to include($data['nickname_original'])
			ensure
				personalCenterPage.username.click
				personalSettingPage.quit.click
				button('退出').click#alert_accept执行效率太低，弃用
				personalCenterPage.username.click
			end
		end
		it 'login_with_password_remember work' do
			loginPage.login_with_password_remember($data['right_phoneNum'], $data['right_password'])
			personalCenterPage.username.click
			personalSettingPage.quit.click
			buttons[0].click#alert_dismiss执行效率太低，弃用
			expect(personalSettingPage.quit.displayed?).to be true
			personalSettingPage.quit.click
			button('退出').click#alert_accept执行效率太低，弃用
			personalCenterPage.username.click
			loginPage.login_btn.click
			expect(afterLoginPage.title.displayed?).to be true
			expect(afterLoginPage.username.text).to include($data['nickname_original'])

			afterLoginPage.username.click
			personalSettingPage.quit.click
			button('退出').click#alert_accept执行效率太低，弃用
		end
		it 'login_with_autologin work' do
			personalCenterPage.username.click
			loginPage.login_with_autologin($data['right_phoneNum'], $data['right_password'])
			back_click
			back_click
			start_activity app_package: 'com.changhong.ssc.cookbook', app_activity: 'com.changhong.superapp.activity.SplashActivity'
			homePage.personal_center.click
			expect(afterLoginPage.home_location.displayed?).to be true

			afterLoginPage.username.click
			personalSettingPage.quit.click
			button('退出').click#alert_accept执行效率太低，弃用
		end
	end #Login page
	context "personalSettingPage" do
		before :all do
			personalCenterPage.username.click
			loginPage.login_with_autologin($data['right_phoneNum'], $data['right_password'])
			personalCenterPage.protrait.click
		end
		it 'personalSettingPage elements check' do
			expect(personalSettingPage.title.displayed?).to be true
			expect(personalSettingPage.protraitsetting.displayed?).to be true
			expect(personalSettingPage.nickname.displayed?).to be true
			expect(personalSettingPage.resetpswd.displayed?).to be true
			expect(personalSettingPage.quit.displayed?).to be true
		end
		context 'protraitsettingPage', :skip => false do
			it 'protraitsettingPage elements check' do
				personalSettingPage.protraitsetting.click
				expect(protraitsettingPage.take_photo_btn.displayed?).to be true
				expect(protraitsettingPage.pick_photo_btn.displayed?).to be true
				expect(protraitsettingPage.cancel_btn.displayed?).to be true
				protraitsettingPage.cancel_btn.click
			end
		end #protraitsettingPage
		context "nickNamePage", :skip => false do
			it 'nickNamePage elements check' do
				personalSettingPage.nickname.click

				expect(nickNamePage.goback.displayed?).to be true
				expect(nickNamePage.title.text).to eq('昵称')
				expect(nickNamePage.save.text).to eq('保存')
				expect(nickNamePage.remove.displayed?).to be true
				expect(nickNamePage.nickname_EditText.displayed?).to be true
			end
			it 'nickname remain without reset' do
				begin
					nickNamePage.remove.click
					expect(nickNamePage.nickname_EditText.text).to eq("请输入新的昵称")
				ensure
					nickNamePage.goback.click
					expect(personalSettingPage.nickname.text).to eq($data['nickname_original'])
				end
			end
			it 'nickname reset fail more than 10 char' do
				begin
					personalSettingPage.nickname.click
					nickNamePage.reset_nickname($data['nickname_reset_11char'])
					expect(nickNamePage.nickname_EditText.displayed?).to be true
				ensure
					nickNamePage.goback.click
				end
			end
			it 'nickname reset success within 10 char' do
				begin
					personalSettingPage.nickname.click
					nickNamePage.reset_nickname($data['nickname_reset'])
					expect(personalSettingPage.nickname.text).to eq($data['nickname_reset'])
				ensure
					personalSettingPage.nickname.click
					nickNamePage.reset_nickname($data['nickname_original'])
				end
			end
		end #nicknamePage
		context 'resetpswdPage' do
			before :each do
				personalSettingPage.resetpswd.click
			end
			after :each do
				resetpswdPage.goback.click if exists{resetpswdPage.goback}
			end
			it 'resetpswdPage elements check' do
				expect(resetpswdPage.goback.displayed?).to be true
				expect(resetpswdPage.title.text).to eq('修改密码')
				expect(resetpswdPage.oldpswd_EditText.displayed?).to be true
				expect(resetpswdPage.newpswd_EditText.displayed?).to be true
				expect(resetpswdPage.newpswd_repeat_EditText.displayed?).to be true
				expect(resetpswdPage.save.displayed?).to be true
			end
			it 'resetpswd without old_password' do
				resetpswdPage.reset_pswd(nil,$data['new_password'],$data['new_password'])
				expect(resetpswdPage.save.displayed?).to be true
			end
			it 'resetpswd without newpswd' do
				resetpswdPage.reset_pswd($data['right_password'],nil,nil)
				expect(resetpswdPage.save.displayed?).to be true
			end
			it 'resetpswd with wrong_old_password' do
				resetpswdPage.reset_pswd($data['wrong_password'],$data['new_password'],$data['new_password'])
				expect(resetpswdPage.save.displayed?).to be true
			end
			it 'resetpswd with wrong_repeat_password' do
				resetpswdPage.reset_pswd($data['right_password'],$data['new_password'],$data['wrong_password'])
				expect(resetpswdPage.save.displayed?).to be true
			end
			it 'resetpswd success' do
				resetpswdPage.reset_pswd($data['right_password'],$data['new_password'],$data['new_password'])
				expect(personalSettingPage.resetpswd.displayed?).to be true
			end
		end #resetpswdPage
	end #personalSettingPage
end #personalCenterPage
