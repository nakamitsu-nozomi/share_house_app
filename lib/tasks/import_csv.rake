# namespace :import_csv do
#   require "import"
#   desc "物件のCSVデータをインポートするタスク"
#   task house: :environment do
#     list=Import.csv_data(path: "db/csv_data/house_sample.csv")
#     House.create!(list)
#     puts "物件の初期データを投入しました。"
#   end
# end


require 'csv'

namespace :import_csv do
  desc "物件のCSVデータをインポートするタスク"

  task house: :environment do
    path = File.join Rails.root, "db/csv_data/houses_sample4.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          name: row["name"],
          service_fee: row["service_fee"],
          station: row["address"],
          access: row["access"],
          house_size: row["house_size"],
          convenience: row["convenience"],
          content: row["content"],
          user_id: row["user_id"],
          area_id: row["area_id"],
          address: row["address"],
          kitchen: row["kitchen"],
          refrigerator: row["refrigerator"],
          laundry: row["laundry"],
          dryer: row["dryer"],
          toilet: row["toilet"],
          shower: row["shower"],
          bathroom: row["bathroom"]
      }
    end
    puts "start to create prefectures data"
    House.create!(list)
    puts "completed!!"
  end
end


