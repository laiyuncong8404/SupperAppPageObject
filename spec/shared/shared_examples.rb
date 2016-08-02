# encoding: utf-8
require_relative "../requires"

shared_examples 'login' do
	it 'should login success' do
		homePage.personal_center.click
		personalCenterPage.username.click
		loginPage.login($data['registed_phoneNum'], $data['right_password'])
		onProgress()
		expect(personalCenterPage.username.text).to include($data['nickname_original'])
	end 
end 
