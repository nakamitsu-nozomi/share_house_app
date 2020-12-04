namespace :import_csv do
  require "import"
  desc "物件のCSVデータをインポートするタスク"
  task house: :environment do
    list=Import.csv_data(path: "db/csv_data/houses_sample4.csv")
    House.create!(list)
    puts "物件の初期データを投入しました。"
  end
end


