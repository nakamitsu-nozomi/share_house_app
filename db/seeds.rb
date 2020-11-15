EMAIL = 'test@example.com'
PASSWORD = 'password'
NAME = "test"
USER_ICON = "public/images/fallback/default.png"
ADRESS = "東京"
EXPERIENCE = true
# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  user.name = NAME
  user.user_icon =USER_ICON
  user.adress = ADRESS
  user.experience = EXPERIENCE
  puts 'ユーザーの初期データインポートに成功しました。'
end 
# 管理者ユーザーが存在しないときだけ作成
User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = PASSWORD
  user.name = "管理者"
  user.user_icon =USER_ICON
  user.adress = ADRESS
  user.experience = EXPERIENCE
  user.admin = true
  puts '管理者ユーザーの初期データインポートに成功しました。'
end 

# facilityの初期データ投入
Facility.create([
  {name: "リビング",icon: "icons/couch.png"},
  {name: "WiFi",icon: "icons/wi-fi.png"},
  {name: "駐輪場",icon: "icons/bike.png"}
  ])