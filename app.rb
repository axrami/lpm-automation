require 'sinatra'
require 'json'
require 'pp'
require 'rake'
require_relative 'Manager.rb'

mobile_regex = /iPhone|iPad|Android/

get '/' do
  matches_mobile = request.env["HTTP_USER_AGENT"] =~ mobile_regex
  if matches_mobile.is_a?(Integer)
    erb :mindex
  else
    erb :index
  end
end

get '/test/ios/?:test_case?' do
	@test_case = params[:test_case] || nil
	Manager.ios @test_case
end

get '/test/android/?:test_case?' do
	@test_case = params[:test_case] || nil
	Manager.android @test_case
end

get '/test/test' do
	Manager.test
end

get '/get_cases/?:platform?' do
	@platform = params[:platform] || nil
	if @platform == nil
		erb :index
	else
		Manager.test_cases @platform
	end
end

