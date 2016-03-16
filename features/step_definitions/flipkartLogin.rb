require 'watir-webdriver'
require 'rspec'
require 'rubygems'

Given /^I navigate to flip-kart$/ do
@browser = Watir::Browser.new :ff
@browser.goto "https://www.flipkart.com/account/login"
end

When /^I enter user name and password into the text field and click login$/ do
userName = @browser.text_field(:class, 'fk-input login-form-input user-email')
password = @browser.text_field(:class, 'fk-input login-form-input user-pwd')
loginButton = @browser.button(:class, 'submit-btn login-btn btn')
userName.set'sumeshnimje@gmail.com'
password.set'sumeshnimje@03'
loginButton.click

end

Then /^the text Hi Sumesh! should be present$/ do
#@browser.div(:id => 'resultSearch').wait_until_present
sleep(5)
@browser.link(:text => /Hi Sumesh!/).present?.should == true
@browser.close
end