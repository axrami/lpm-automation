require 'sinatra'
require 'json'
require 'pp'
require 'rake'

mobile_regex = /iPhone|iPad|Android/

get '/' do
  matches_mobile = request.env["HTTP_USER_AGENT"] =~ mobile_regex
  if matches_mobile.is_a?(Integer)
    erb :mindex
  else
    erb :index
  end
end

get '/rake/iOS' do
	puts 'See test resutls at https://saucelabs.com/'
	# Rake::Task['ios'].invoke
	`rake ios`
end

