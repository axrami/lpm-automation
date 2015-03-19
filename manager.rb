require 'sinatra'
require 'json'
require 'rake'

class Manager

  def self.android test_case
    `cp android_appium.txt appium.txt`
    if test_case != nil
      `rake android[#{ test_case }]`
    else
      `rake android`
    end
  end

  def self.ios test_case
    `cp ios_appium.txt appium.txt`
    if test_case != nil
      `rake ios[#{test_case}]`
    else
      `rake ios`
    end
  end

  def self.test
    puts '-----------hello--------- \n' * 5
  end

  def self.test_cases platform
    if platform == 'ios'
      file = Dir['./appium/ios/specs/*']
      return file.to_json
    elsif platform == 'android'
      file = Dir['./appium/android/specs/*']
      return file.to_json
    else
      puts 'platform not supported'
    end
  end

end