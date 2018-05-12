require 'json'
require 'faker'
desc 'Read jobs file'


task read_file: :environment do
  file = File.read('lib/assets/store2.json')
  file2 = "lib/assets/store1.json"

  data_hash = JSON.parse(file)

  File.open(file2, "w") do |e_json|
    e_json.puts '['
    data_hash.each do |store|
      temp1 = store['address'].gsub("47000", '')
      e_json.puts '{"storename": "' + store["storename"] + 
                  '", "address": "' + temp1 + 
                  '", "dish": "' + store["dish"] + 
                  '", "des": "' + store["des"] + 
                  '", "open_time": "' + store["open_time"] + 
                  '", "phone":"' + store["phone"] + '"},'
    end
    e_json.puts ']'
  end

end