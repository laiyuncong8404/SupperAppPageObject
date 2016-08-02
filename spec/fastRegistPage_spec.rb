# encoding: utf-8
require_relative "requires"

describe 'fastRegistPage',:skip => false  do
	before :all do
		homePage.personal_center.click
		personalCenterPage.username.click
		loginPage.fastRegist_TextView.click
	end
	after :all do
		back_click #手机BACK键，程序执行了，但是设备没有响应，原因未知
	end
	it 'fastRegistPage elements check' do
		expect(fastRegistPage.title.displayed?).to be true
		expect(fastRegistPage.phoneNum.displayed?).to be true
		expect(fastRegistPage.identifyCode.displayed?).to be true
		expect(fastRegistPage.get_indentifyCode_btn.displayed?).to be true
		expect(fastRegistPage.serviceRules_checkbox.displayed?).to be true
		expect(fastRegistPage.serviceRules.displayed?).to be true
		expect(fastRegistPage.next_btn.displayed?).to be true
	end
	it 'get_indentifyCode_btn and next_btn should all disabled' do
		fastRegistPage.regist(nil,nil)
		expect(fastRegistPage.get_indentifyCode_btn.attribute('enabled')).to eq('false')
		expect(fastRegistPage.next_btn.attribute('enabled')).to eq('false')
	end
	it 'regist with registed_phoneNum should notice' do
		fastRegistPage.regist($data['registed_phoneNum'],nil)
		expect(text('手机已注册').displayed?).to be true
		expect(fastRegistPage.get_indentifyCode_btn.attribute('enabled')).to eq('false')
		expect(fastRegistPage.next_btn.attribute('enabled')).to eq('false')
	end
	it 'regist with unregisted_phoneNum and nil indentifyingCode' do
		fastRegistPage.regist_without_btn_click($data['unregisted_phoneNum'], nil)
		expect(fastRegistPage.get_indentifyCode_btn.attribute('enabled')).to eq('true')
		expect(fastRegistPage.next_btn.attribute('enabled')).to eq('false')
	end
	it 'get_indentifyCode_btn and next_btn should all enabled' do
		fastRegistPage.regist_without_btn_click($data['unregisted_phoneNum'], $data['wrong_indentifyingCode'])
		expect(fastRegistPage.get_indentifyCode_btn.attribute('enabled')).to eq('true')
		expect(fastRegistPage.next_btn.attribute('enabled')).to eq('true')
		expect(fastRegistPage.title.displayed?).to be true
	end
	it 'next_btn should disbaled when serviceRules_checkbox is unchecked' do
		expect(fastRegistPage.serviceRules_checkbox.attribute('checked')).to eq('true')
		fastRegistPage.serviceRules_checkbox.click
		fastRegistPage.regist($data['unregisted_phoneNum'], $data['wrong_indentifyingCode'])
		expect(fastRegistPage.next_btn.attribute('enabled')).to eq('false')
	end
	it 'serviceRules check' do
		fastRegistPage.serviceRules.click
		expect(text('注册协议').displayed?).to be true
		# swipe(start_x: 450, start_y: 1700, end_x: 550, end_y: 340, duration: 2000)
		scroll_to('正文完')
		expect(text('长虹公司').displayed?).to be true
	end
end #fastRegist page
