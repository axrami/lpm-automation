require_relative '../requires' # enable auto complete in RubyMine

describe 'spec home, buttons, and controls' do

  t 'spec' do
  	# sendBtn = find_element(:name, "send")
  	# menu = find_element(:id, "menu")
  	# inputBar = find_element(:class, "UIATextView").send_keys "hi"
  	alert = driver.switch_to.alert.accept
  	alert = driver.switch_to.alert.accept
  	find('ESFMasterViewController.settingsButton').click
  	# account
  	find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAImage[1]/UIATextField[1]").send_keys "P36511428"
  	# skill
  	find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAImage[2]/UIATextField[1]").send_keys "mobile"
  	find_element(:name, "Staging").click
  	find_element(:name, "ESFSettingsViewController.saveButton").click
  	text('CYL').click
  	find_element(:name, "ESFDetailViewController.helpButton").click
  	inputBar = find_element(:class, "UIATextView").send_keys "hi"
  	sendBtn = find_element(:name, "send").click
  	inputBar = find_element(:class, "UIATextView").send_keys "My name is Andrew"
  	sendBtn = find_element(:name, "send").click
  	inputBar = find_element(:class, "UIATextView").send_keys "No my name is Andrew"
  	sendBtn = find_element(:name, "send").click
  	menu = find_element(:id, "menu").click
  	menu = find_element(:id, "menu").click
  	inputBar = find_element(:class, "UIATextView").send_keys "end"
  	sendBtn = find_element(:name, "send").click
  	wait {alert = driver.switch_to.alert.accept}

  end
end