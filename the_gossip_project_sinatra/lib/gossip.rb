require 'csv'


class Gossip
	attr_accessor :author, :content

	def initialize(a, b)
		@author = a
		@content = b
	end	

	def save
	  CSV.open("./db/gossip.csv", "ab") do |csv|
   	 	csv << ["#{@author}", "#{@content}"]
 	  end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
    	all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  return all_gossips
	end	

	def self.find(tout)
		truc = Gossip.all
		tout = tout.to_i - 1
		rech = truc[tout]
		return rech
	end	

	  def self.update(nb, author, content)
    map = CSV.read('./db/gossip.csv')
    map[nb] = [author, content]

    CSV.open('./db/gossip.csv', 'w') do |csv|
      map.each do |info|
        csv << [info[0], info[1]]
      end
    end
	end
end