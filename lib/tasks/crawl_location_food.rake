#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'


task crawl_location_food: :environment do
  # Fetch and parse HTML document
  doc = Nokogiri::HTML(open('https://www.foody.vn/ha-noi/nha-hang?categorygroup=food'))

  file = "totalstore.json"
  location = []
  address = []

  File.open(file, "w") do |e_json|
    e_json.puts doc

  end

  #   e_json.puts '['
  #   doc.xpath("//div[@class='result-name']//a").each do |lo|
  #     location.push(lo.content)
  #   end
  #   doc.xpath("//div[#@class='address']//span//span | //div[#@class='address']//span").each do |ad|
  #     address.push(ad.content)
  #   end
  #   i = 0
  #   doc.xpath("//a[@class='row-view-reviews']//content//span").each do |des|

  #     description = push(des.content)
  #     e_json.puts '{"name": "' + location[i] + '", "address": "' + address[i] + '"},'
  #     i= i + 1
  #   end
  #   e_json.puts ']'
  # end
  
end