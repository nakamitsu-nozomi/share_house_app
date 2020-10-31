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


