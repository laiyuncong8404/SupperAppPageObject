# encoding: utf-8
require_relative "requires"

describe "Guinea Pig" do
	it "devices list element check" do
		el1 = homePage.devices_list
		expect(el1.displayed?).to be true
	end
	it "health_living element check" do
		el2 = homePage.health_living
		expect(el2.displayed?).to be true
	end
	it "personal_center" do
		expect(homePage.personal_center.displayed?).to be true
	end
	it 'personal_center page elements check' do
		homePage.personal_center.click

		expect(personalCenterPage.title.text) == '个人中心'
		expect(personalCenterPage.setview.displayed?).to be true
		expect(personalCenterPage.protrait.displayed?).to be true
		expect(personalCenterPage.username.displayed?).to be true
		expect(personalCenterPage.msgcenter.displayed?).to be true
		expect(personalCenterPage.customer.displayed?).to be true
		expect(personalCenterPage.userbook.displayed?).to be true
		expect(personalCenterPage.update.displayed?).to be true
	end
	context "Login page" do
	it 'login without username and  password' do
		personalCenterPage.protrait.click
		loginPage.login(nil, nil)
		expect(loginPage.login_btn.displayed?).to be true
	end
	it 'login success' do
		loginPage.login($data['registed_phoneNum'], $data['right_password'])
		onProgress()
		expect(personalCenterPage.username.text).to include("荷西")
	end
	end
end

