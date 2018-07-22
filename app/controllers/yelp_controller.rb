require 'net/http'
require 'uri'

class YelpController < ApplicationController
	def search

		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		p params[:lat]
		p params[:lng]
		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


		uri = URI.parse("https://api.yelp.com/v3/businesses/search?term=coffee&latitude=#{params[:lat]}&longitude=#{params[:lng]}")
		request = Net::HTTP::Get.new(uri)
		request["Authorization"] = "Bearer w13Zl2KDKOvqXgFAdqT8ILu4so2B8Kv8ulo5oHDjzabmUWOA2v68V4fPPBB-UAHYoOiasYYUGoUPznSNXBqQ3338GZ4ITXO1V9y0pNqiQlXl3iZvxOseL_vH_jJUW3Yx"

		req_options = {
		  use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  http.request(request)
		end

		render :json => response.body





	end
end
