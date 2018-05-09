require 'json'
require 'faker'
desc 'Read jobs file'


task read_store_file: :environment do
  file = File.read('lib/assets/total_store.json')
  data_hash = JSON.parse(file)
  data_hash.each do |store|
    data_hash.each do |store|
      Location.create(
        name: store['storename'],
        user_id: 1,
        address: store['address'],
        phone: store['phone'],
        description: store['des'],
        status: true,
        radius: Faker::Number.between(1, 5),
        sum_rate: 0,
        rate_avg: 0
        )
    end
    binding.pry
  end
end
