#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'


task crawl_location_food: :environment do
  # Fetch and parse HTML document
  link = ['https://www.tripadvisor.com.vn/Restaurants-g293924-c8-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-c27-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-c20-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-c41-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-c26-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-zfz10665-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-c10646-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293924-zfz10992-Hanoi.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293925-Ho_Chi_Minh_City.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c8-Ho_Chi_Minh_City.html', 
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c27-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c33-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c20-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c41-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c26-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-zfz10665-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293925-c10646-Ho_Chi_Minh_City.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c8-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c33-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c41-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c26-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c31-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293928-c6-Nha_Trang_Khanh_Hoa_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c8-Hue_Thua_Thien_Hue_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c6-Hue_Thua_Thien_Hue_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c31-Hue_Thua_Thien_Hue_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c26-Hue_Thua_Thien_Hue_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c41-Hue_Thua_Thien_Hue_Province.html',
    'https://www.tripadvisor.com.vn/Restaurants-g293926-c33-Hue_Thua_Thien_Hue_Province.html'
  ]                                                     

  file = "xxx.json"
  address = []
  storename = []
  image_list = []
  phone = []
  des = []
  dish = []
  open_time = []
  File.open(file, "w") do |e_json|
    e_json.puts '['
    i = 0
    link.each do |link_item|
      doc = Nokogiri::HTML(open(link_item))
      doc.xpath("//a[@class='poiTitle'] | //a[@class='property_title']").each do |stn|
        storename.push(stn.content.gsub("\n", '').gsub("\r", ''))
        doc_details = Nokogiri::HTML(open('https://www.tripadvisor.com.vn' + stn.attributes['href'].value))
        if doc_details.xpath("//span[@class='street-address']").first != nil && doc_details.xpath("//span[@class='locality']").first != nil
          address.push(doc_details.xpath("//span[@class='street-address']").first.content + ' ' + doc_details.xpath("//span[@class='locality']").first.content)
        elsif doc_details.xpath("//span[@class='street-address']").first != nil && doc_details.xpath("//span[@class='locality']").first == nil
          address.push(doc_details.xpath("//span[@class='street-address']").first.content)
        elsif doc_details.xpath("//span[@class='street-address']").first == nil && doc_details.xpath("//span[@class='locality']").first != nil
          address.push(doc_details.xpath("//span[@class='locality']").first.content)
        end

        if doc_details.xpath("//div[@class='blEntry phone']//span")[1] != nil
          phone.push(doc_details.xpath("//div[@class='blEntry phone']//span")[1].content)
        else
          phone.push("")
        end
        if doc_details.xpath("//div[@class='ui_column is-6 cuisines']//div[@class='text']").first != nil
          dish.push(doc_details.xpath("//div[@class='ui_column is-6 cuisines']//div[@class='text']").first.attributes['data-content'].value)
        else
          dish.push("")
        end
        if doc_details.xpath("//div[@class='table_section']//div[@class='row']//div[@class='content']")[3] != nil
          des.push(doc_details.xpath("//div[@class='table_section']//div[@class='row']//div[@class='content']")[3].content.gsub("\n", '').gsub("\r", ''))
        else
          des.push("")
        end
        if doc_details.xpath("//span[@class='currentRange']").first != nil
          open_time.push(doc_details.xpath("//span[@class='currentRange']").first.content)
        else
          open_time.push("")
        end
        e_json.puts '{"storename": "' + storename[i] + 
                    '", "address": "' + address[i] + 
                    '", "dish": "' + dish[i] + 
                    '", "des": "' + des[i] + 
                    '", "open_time": "' + open_time[i] + 
                    '", "phone":"' + phone[i] + '"},'

        i = i + 1
      end
    end
    e_json.puts ']'
  end

end
