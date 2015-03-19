require 'rubygems'
require 'rake'


def run_sh cmd
  begin
    ; sh cmd;
  rescue;
  end
end


def bash cmd
  sh cmd do |successful, result|
    if !successful && result.exitstatus === 7
      Rake::Task['install'].execute
      run_sh cmd
    end
  end
end

def wait_for_valid_device
  while `adb shell echo "ping"`.strip != 'ping'
    `adb kill-server`
    `adb devices`
    sleep 5
  end
end

# rake android['single_text_name']
# rake android
def run_android test_file=nil
  wait_for_valid_device
  cmd = 'bundle exec ruby ./appium/run.rb android'
  cmd += %Q( "#{ test_file }") if test_file
  bash cmd
end

desc 'Run the Android tests'
task :android, :args, :test_file do |args, test_file|
  run_android test_file[:args]
end


desc 'Run iOS tests'
task :ios, :args, :test_file do |args, test_file|
  test_file = test_file[:args]
  path = File.expand_path('appium.txt', Rake.application.original_dir)
  ENV['APPIUM_TXT'] = path
  puts "Rake appium.txt path is: #{ path }"
  cmd = 'bundle exec ruby ./appium/run.rb ios'
  cmd += %Q( "#{ test_file }") if test_file
  bash cmd
end

desc 'Run bundle install'
task :install do
  sh 'bundle install'
end
