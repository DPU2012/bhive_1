

class WebsiteController < ApplicationController
before_filter :start_filter
class Filter
attr_accessor :bbase, :nbbase, :conformList, :sensList


def initialize
	bullybase = Hash[]
	bullybase["count"] = 0
	@bbase = bullybase
	
	nbullybase = Hash[]
	nbullybase["count"] = 0
	@nbbase = nbullybase
	
	con = Hash[]
	con["dayum"] = "damn"
	con["dmn"] = "damn"
	con["damm"] = "damn"
	@conformList = con
	
	sens = Hash[]
	sens["skinny"] = 2
	sens["skeleton"] = 3
	sens["stick"] = 3
	@sensList = sens
end

#pofbully
def pofbully
    nb = self.nbbase["count"]
	b = self.bbase["count"]
	return (b)/(n*b)
	
end
def findPs(word="Emptyword")
	bcount = 0 
	nbcount =0
	bwordfreq = 0
	nbwordfreq = 0
	
	pword = 0
	pwordb = 0
	total = 0
	
	x = 0
	while(x<self.bbase["count"])	
		if(bbase[x][word] != nil)
			bwordfreq += 1
		end
		x += 1
	end
	bcount = self.bbase["count"]
#-----------------------------------------------------	
	x = 0
	while(x<self.nbbase["count"])	
		if(nbbase[x][word] != nil)
			nbwordfreq += 1
		end
		x += 1
	end
	nbcount = self.nbbase["count"]
#Calculations
	
	total = bcount + nbcount
	pword = (bwordfreq+nbwordfreq)*1.0/total
	
	if(pword == 0 or bwordfreq == 0)
		return 1+sensitiveWords(word)
	end
	pwordb = (bwordfreq*1.0)/bcount
	
	print "#{word} #{pwordb}/#{pword}"
	return (pwordb*1.0)+sensitiveWords(word)/(pword)
	
end

def train(category, text)
	hash = Hash[]
	hash["category"] = category
	hash["wordcount"] = 0
	wordcount = 0
	word = ""
	
	file = StringIO.new(text,"r")
	

	while(true)
		char = file.getc
		if(char == nil or char.chr == ' ' or char.eql?("\n"))
			#puts "#{word}"
			#add other word unifiers, simplifiers here
			word = word.downcase
			if( hash[word] == nil)
				hash[word] = 1
			else
				hash[word] += 1
			end
			wordcount += 1
			word.clear	
		else
			word = word.concat(char.chr)
		end
		
		if(char == nil) 
			break 
		end
	end
	hash["wordcount"] = wordcount
	puts "#{hash}"
	if(category.eql?("bullying"))
		x = bbase["count"]
		bbase["count"] += 1
		self.bbase[x] = hash
	else
		x = nbbase["count"]
		nbbase["count"] += 1
		self.nbbase[x] = hash
	end
end

def findP(text="nowordblank")
	p = 1.0
	file = StringIO.new(text,"r")
	word =""
	
	while(true)		
		char = file.getc
		if(char == nil or char.chr == ' ' or char.eql?("\n"))
			word = word.downcase
			word = self.conformToken(word)
			p = p * 1.0 * self.findPs(word)
			puts "|||||  #{word},#{p} \n"
			word.clear	
		else
			word = word.concat(char.chr)
		end
		
		if(char == nil) 
			break 
		end
	end	
	
	p *= 0.3
	return Math.log(p)
end

def sensitiveWords(token)

	if @sensList[token] != nil
		return @sensList[token]
	else
		return 0
	end
end

def conformToken(token)
	if @conformList[token] != nil
		return @conformList[token]
	else
		return token
	end
end

end


  def home
  
	@id = @@wall.get_object("me")["username"]
	@wall = @@wall
	@bayes = @@bayes
	@wallsource = @wall.get_connections(@id, "feed")
	@self = @wall.get_object(@id)
  end
  
  def feed
	@wall = @@wall
	@bayes =@@bayes
	@wallsource = @wall.get_connections("yechan.j.hong", "home")
	@self = @wall.get_object("yechan.j.hong")
  end
  
  def train
	@@bayes.train("bullying",params[:message])	
	@test =@@bayes.bbase
  end
  def postToWall
	@message = params[:message][:text]
	@@wall.put_wall_post(@message)
  end
  private      
  def start_filter
	session.clear
    @@facebook_cookies ||= Koala::Facebook::OAuth.new('393160320721597', 'bbaf9cd1aa2c6716d786c99cbfd875f9','http://localhost:3000/website/signin').get_user_info_from_cookie(cookies)
	@@access_token = @@facebook_cookies["access_token"]
	@@wall = Koala::Facebook::API.new(@@access_token)
	@@bayes = Filter.new
	database = Bdatabase.all
	(0..database.size-1).each do |i|
		@@bayes.train(database[i].mtype,database[i].msg)
	end
  end
  


end
