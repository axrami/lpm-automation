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
	# Rake::Task['ios'].invoke
	`rake ios`
end

get '/test/iOS' do
	erb :index
end

