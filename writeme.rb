require "erb"
require "httparty"
require "nokogiri"


tdl_res = HTTParty.get("https://raw.githubusercontent.com/ronnapatp/today-I-learn/main/README.md")
tdl_entries = tdl_res.body.strip.split("\n").select { |l| l.start_with?("- ") }.size

witq_res = HTTParty.get("https://raw.githubusercontent.com/ronnapatp/what-I-eat-today/main/README.md")
witq_entries = witq_res.body.strip.split("\n").select { |l| l.start_with?("- ") }.size

witqe_res = HTTParty.get("https://raw.githubusercontent.com/ronnapatp/what-I-eat-today/english/README.md")
witqe_entries = witqe_res.body.strip.split("\n").select { |l| l.start_with?("- ") }.size

it_res = HTTParty.get("https://raw.githubusercontent.com/ronnapatp/intheofficefor/main/Readme.md")
it_entries = it_res.body.strip.split("\n").select { |l| l.start_with?("- ") }.size

bwb_res = HTTParty.get("https://raw.githubusercontent.com/ronnapatp/antibadwordbot/main/README.md")
bwb_entries = bwb_res.body.strip.split("\n").select { |l| l.start_with?("- ") }.size

kumi_res = HTTParty.get("https://raw.githubusercontent.com/Kumi-the-chubby-bear/website/main/product/product.json")
kumi_total = JSON.parse(kumi_res.body)["total"]

followers_res = HTTParty.get("https://api.github.com/users/ronnapatp")
followers_total = JSON.parse(followers_res.body)["followers"]

following_res = HTTParty.get("https://api.github.com/users/ronnapatp")
following_total = JSON.parse(following_res.body)["following"]



#module MyApp
#  class Application < Rails::Application
#    config.time_zone = 'Indochina Time'

#    # ...
#  end
#end

time = Time.new
#Time.zone = "ICT"
#time = Time.zone.now()

@active_projects = [
  { name: "ronnapat.com", link: "https://ronnapat.com/" , duration: "Repo not public" },
  { name: "My Blog", link: "https://blog.ronnapat.com/" , duration: "Repo not public" },
  { name: "Kumi official website", link: "https://github.com/Kumi-the-chubby-bear/New-KumiWeb" , duration: " We have #{kumi_total} product 😲 " },
  { name: "Kaolad bot", link: "https://github.com/ronnapatp/kaoladbot" , duration: "Moderator command music and leveling!" },
  { name: "Kumi's utilities", link: "https://discord.com/invite/Tr2hrmzb4s" },
  { name: "How to?", link: "https://github.com/ronnapatp/howto" },
]

@past_projects = [
  { name: "Anti badword discord bot", link: "https://github.com/ronnapatp/antibadwordbot", duration: "(#{bwb_entries} languages)"},
  {
    name: "In the office for...",
    link: "https://in-the-office-for.web.app/",
    duration: "**#{it_entries}** Country in website 🗾",
    
  },
    { name: "กินอะไรดี? ver.Thai", link: "https://todayfood.vercel.app/", duration: "**#{witq_entries}** menu 🍜" },
  # { name: "กินอะไรดี? ver.Eng", link: "https://today-food-eng.vercel.app/", duration: "**#{witqe_entries}** menu🍛" },
]

@profile = [
  { name: "I have #{followers_total} followers!"},
  { name: "I follow #{following_total} people!"}
]

@update = [
  { name: time.strftime("%Y-%m-%d %H:%M:%S") }
]

template = File.read("writeme.md.erb")

content = ERB.new(template, nil, "<>").result

File.write("README.md", content)

puts "README updated."
