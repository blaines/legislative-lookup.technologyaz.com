desc "Fetch Arizona Legislature from http://www.azleg.gov/MemberRoster.asp?Body=&SortBy=2"
task :fetch_legislature => :environment do
  require 'nokogiri'
  require 'open-uri'
  puts "#" * 75
  puts "FETCHING ARIZONA LEGISLATURE"
  url = 'http://www.azleg.gov/MemberRoster.asp?SortBy=2'
  doc = Nokogiri::HTML(open(url))
  senate = doc.css("#senate tr")
  senate.shift
  senate.each do |z|
    legislator = Legislator.new
    legislator.region         = "AZ"
    legislator.chamber        = "senate"
    legislator.session        = "87"
    fullname                  = z.at_css("td:nth-child(1) a").text.gsub(/(\r|\n|\t|\".+\")/,"").split(" ")
    legislator.first_name     = fullname[0]
    legislator.last_name      = fullname[1] if fullname.size == 2
    legislator.middle_name    = fullname[1] if fullname.size == 3
    legislator.last_name      = fullname[2] if fullname.size == 3
    legislator.middle_name    = fullname[1] if fullname.size == 4
    legislator.last_name      = fullname[2] if fullname.size == 4
    legislator.suffix         = fullname[3] if fullname.size == 4
    legislator.district       = z.at_css("td:nth-child(2)").text
    legislator.party          = z.at_css("td:nth-child(3)").text
    legislator.email_address  = z.at_css("td:nth-child(4) a").text.gsub(/(\r|\n|\t|\s|-)/,"")
    legislator.phone_number   = "602" + z.at_css("td:nth-child(6)").text.gsub(/(-|\(|\))/,"")
    legislator.fax_number     = "602" + z.at_css("td:nth-child(7)").text.gsub(/(-|\(|\))/,"")
    legislator.save
  end
  house = doc.css("#house tr")
  house.shift
  house.each do |z|
    legislator = Legislator.new
    legislator.region         = "AZ"
    legislator.chamber        = "house"
    legislator.session        = "87"
    fullname                  = z.at_css("td:nth-child(1) a").text.gsub(/(\r|\n|\t|\".+\")/,"").split(" ")
    legislator.first_name     = fullname[0]
    legislator.last_name      = fullname[1] if fullname.size == 2
    legislator.middle_name    = fullname[1] if fullname.size == 3
    legislator.last_name      = fullname[2] if fullname.size == 3
    legislator.middle_name    = fullname[1] if fullname.size == 4
    legislator.last_name      = fullname[2] if fullname.size == 4
    legislator.suffix         = fullname[3] if fullname.size == 4
    legislator.district       = z.at_css("td:nth-child(2)").text
    legislator.party          = z.at_css("td:nth-child(3)").text
    legislator.email_address  = z.at_css("td:nth-child(4) a").text.gsub(/(\r|\n|\t|\s|-)/,"")
    legislator.phone_number   = "602" + z.at_css("td:nth-child(6)").text.gsub(/(-|\(|\))/,"")
    legislator.fax_number     = "602" + z.at_css("td:nth-child(7)").text.gsub(/(-|\(|\))/,"")
    legislator.save
  end
end
