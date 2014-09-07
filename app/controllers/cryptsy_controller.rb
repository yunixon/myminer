require 'cryptsy/api'

class CryptsyController < ApplicationController

  def getinfo
    cryptsy = Cryptsy::API::Client.new(ENV["CRYPTSY_PUBLIC_KEY"], ENV["CRYPTSY_PRIVATE_KEY"])
    respond_to do |format|
			format.json do 
				binding.pry
				response = cryptsy.getinfo
				render json: response.to_json
			end
		end
  end
  
  def orderbook
		respond_to do |format|
			#format.html
			format.json do 
				response = HTTParty.get('http://pubapi.cryptsy.com/api.php?method=marketdatav2')
				render json: response.to_json
			end
		end
	end

	def market
		cryptsy = Cryptsy::API::Client.new(ENV["CRYPTSY_PUBLIC_KEY"], ENV["CRYPTSY_PRIVATE_KEY"])
		respond_to do |format|
			format.json do 
				#binding.pry
				response = cryptsy.marketdata(params["pairId"].to_i)
				parsed_response = response["return"]["markets"].values[0]
				render json: parsed_response.to_json
			end
		end
	end

	def depth
		cryptsy = Cryptsy::API::Client.new(ENV["CRYPTSY_PUBLIC_KEY"], ENV["CRYPTSY_PRIVATE_KEY"])
		respond_to do |format|
			format.json do 
				#binding.pry
				response = cryptsy.depth(params["pairId"].to_i)
				parsed_response = response["return"]["sell"]
				render json: parsed_response.to_json
			end
		end
	end
  
end
