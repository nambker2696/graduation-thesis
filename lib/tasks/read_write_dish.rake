require 'json'
require 'faker'
desc 'Read jobs file'


task read_store_file: :environment do
  file = File.read('lib/assets/store1.json')
  file2 = "lib/assets/dish_store.json"
  dishname = []
  disheach = []
  data_hash = JSON.parse(file)
  i = 1
  File.open(file2, "w") do |e_json|
    e_json.puts '['
    data_hash.each do |store|
    if store["dish"].split(',') != nil
      dishname = store["dish"].split(',')
      dishname.each do |dn|
        disheach = dn
        puts disheach
        e_json.puts '{"location_id": "' + i.to_s +
                  '", "dish": "' + disheach + '"},'
      end
    else
      dishname.push("")
    end
    i  = i +1
  end
    
    e_json.puts ']'
  end
    

end