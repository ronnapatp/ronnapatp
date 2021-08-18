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

kumi_res = HTTParty.get("https://raw.githubusercontent.com/Kumi-the-chubby-bear/website/main/product/product.json")
kumi_total = JSON.parse(kumi_res.body)["total"]

@active_projects = [
  { name: "Kumi official website", link: "https://github.com/kumi-the-chubby-bear/website" , duration: " We have #{kumi_total} product 😲 " },
  { name: "Kaolad bot V2.0", link: "https://github.com/ronnapatp/kaoladbot" , duration: "Moderator command music and leveling!" },
  { name: "Ronnapatp blog", link: "https://github.com/ronnapatp/blog" },
  { name: "World education", link: "https://github.com/ronnapatp/worldeducation" },
  { name: "Smart team website", link: "https://github.com/ronnapatp/smartteam-website" },
  { name: "การศึกษาไทยเท่าที่เล่าได้", link: "https://thedu.vercel.app/" },
  { name: "กินอะไรดี? ver.Thai", link: "https://todayfood.vercel.app/", duration: "**#{witq_entries}** menu 🍜" },
  { name: "กินอะไรดี? ver.Eng", link: "https://today-food-eng.vercel.app/", duration: "**#{witqe_entries}** menu🍛" },
  {
    name: "Today I learned",
    link: "https://github.com/ronnapatp/today-I-learn/blob/main/README.md",
    duration: "📢 **#{tdl_entries}** Posts",
  },
]

@past_projects = [
  {
    name: "In the office for...",
    link: "https://in-the-office-for.web.app/",
    duration: "**#{it_entries}** Country in website 🗾",
  },
]

template = File.read("writeme.md.erb")

content = ERB.new(template, nil, "<>").result

File.write("README.md", content)

puts "README updated."
