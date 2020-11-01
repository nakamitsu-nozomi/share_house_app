namespace :import_area_csv do
  require "import"
  desc "エリアのCSVデータをインポートするタスク"
  task area: :environment do
    Area.destroy_all
    list=Import.csv_data(path: "db/csv_data/area.csv")
    Area.create!(list)
    puts "エリアの初期データを投入しました。"
  end
end
