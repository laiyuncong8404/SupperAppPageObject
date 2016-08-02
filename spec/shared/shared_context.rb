# encoding: utf-8
require_relative "../requires"

shared_context 'login_before_all', :tags => :login_before_all do
	def login_before_all()
		homePage.personal_center.click
		personalCenterPage.username.click
		loginPage.login($data['registed_phoneNum'], $data['right_password'])
		onProgress()
	end
end 
