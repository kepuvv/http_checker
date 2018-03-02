require 'net/http'

=begin

Another way to check url my_func? == working_url?
	
def my_func?(url_test)
	uri = URI(url_test)
	res = Net::HTTP.get_response(uri)
	res.code == '200'
rescue
	false
end
	
=end

def working_url?(url_str)
  url = URI.parse(url_str)
  Net::HTTP.start(url.host, url.port) do |http|
  http.head(url.request_uri).code == '200'
  end
rescue
  false
end

income = File.open "ping.txt", "a"

"176".upto("178") do |a|
	
	"113".upto("254") do |b|
						
		"001".upto("254") do |c|
			
			"001".upto("254") do |x|
									
			address = "#{a}#{b}#{c}#{x}"
									
			url = "http://" + address
									
			puts "Checking #{url}"
												
				if working_url? url
				#puts "Work!"
				income.write "#{url}\n"
				end
									
			end
		end
	end
end

income.close

puts "Finish"
