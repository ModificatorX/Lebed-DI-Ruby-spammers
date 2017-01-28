require 'open-uri'
def anothertry (content, k)
	si=content.scan(/\w+\:\/{2}[w]{3}\.\w+\.\w+\.\w*\/{0,1}w*/).uniq
	em=content.scan(/[A-Za-z]+@[A-Za-z]+\.[A-Za-z]+\.{,1}[A-Za-z]*/).uniq
	#puts(si)
	$setmail = $setmail | em
	if k<5 and  si.size>0
		for i in 0..si.size-1
			if si[i]!=nil
			if  !$forbiddensites.include?(si[i])
			k=k+1
			#puts(si[i])
			arr=[si[i]]
			$forbiddensites=$forbiddensites | arr
			response = open(si[i]).read
			contnew=response
			anothertry(contnew, k)
			end
			end
		
		
		end
	
	end


end




url = "http://www.mosigra.ru"
#uri = URI.parse(url)
#http = Net::HTTP.new(uri.host, uri.port)
response =  open(url).read
k=0
$setmail=Array.new()
$forbiddensites=[url]
content = response
anothertry(content, k)
puts($setmail)

