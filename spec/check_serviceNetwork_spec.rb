# encoding: utf-8
require_relative "requires"

describe "select" do
	it 'check serviceNetwork' do
	homePage.personal_center.click
	personalCenterPage.username.click
	loginPage.login($data['registed_phoneNum'], $data['right_password'])
	onProgress()
	personalCenterPage.customer.click
	customerServiceCenterPage.serviceNetwork.click
	set_wait(5)

	contexts = available_contexts
	sleep(5)
	set_context(contexts[1])
	sleep(10)

	serviceNetworkPage.select_by_proviceName('广东')
	serviceNetworkPage.select_by_cityName('江门')
	serviceNetworkPage.select_by_regionName('新会区')
	expect(find_element(:css, '#supportScroll > div > ul > li > div').text).to eq('暂无网点信息')
	switch_to_default_context
	end
end