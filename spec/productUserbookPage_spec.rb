# encoding: utf-8
require_relative "requires"

describe "check productUserbookPage", :skip => false do
	include_context "login_before_all"

	it 'check the productInfoPage'do
		login_before_all()

		personalCenterPage.productUserbook.click
		expect(productUserbookPage.productList.displayed?).to be true
		scroll_to($data['product_name'])
		set_wait(3)
		text($data['product_name']).click
		expect(productInfoPage.title.text).to include($data['product_name'])

		set_wait(5)
		contexts = available_contexts
		sleep(3)
		set_context(contexts[1])
		sleep(3)

		expect((productInfoPage.productInfo).size).to eql(12) #ML-iBOX有12张图
		switch_to_default_context
	end
end
