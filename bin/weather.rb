#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'
#require 'time'

API_KEY='70b2606417b31492d2241ce27b251e34'
BASE_URL='http://api.openweathermap.org/data/2.5/weather'
FORECAST_URL='http://api.openweathermap.org/data/2.5/forecast/daily'
GEOLOCATE_URL='http://ip-api.com/json'

uri = URI.parse(URI.encode(GEOLOCATE_URL))
loc_resp = Net::HTTP.get_response(uri)
if loc_resp.code != '200'
    raise 'Could not get location'
end
loc = JSON.parse(loc_resp.body);
CITY="#{loc['city']},#{loc['region']}"

class WeatherAPI
    def initialize(city)
        @city = city
    end

    def get_data
        uri = URI.parse("#{BASE_URL}?q=#{@city}&appid=#{API_KEY}&units=imperial")
        resp = Net::HTTP.get_response(uri)
        if resp.code != '200'
            raise "Invalid response: code=#{resp.code}"
        end
        data = JSON.parse(resp.body)
        puts "#{@city}: #{data["main"]["temp"]}°F"
        #puts "Low: #{data["main"]["temp_min"]}°F"
        #puts "High: #{data["main"]["temp_max"]}°F"
        desc = data['weather'][0]['description'].split(/ /).map{|x| x.capitalize}.join(' ')
        puts desc

        uri = URI.parse("#{FORECAST_URL}?q=#{@city}&appid=#{API_KEY}&units=imperial&cnt=3")
        resp = Net::HTTP.get_response(uri)
        if resp.code != '200'
            raise "Invalid response: code=#{resp.code}"
        end
        data = JSON.parse(resp.body)
        desc = data["list"][0]["weather"][0]["description"].split(/ /).map{|x| x.capitalize}.join(' ')
        puts "Tomorrow: #{data["list"][0]["temp"]["day"]}°F, #{desc}"
    end
end

WeatherAPI.new(CITY).get_data
