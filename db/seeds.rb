# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ApplicationSetting.create(key: 'CLUB_ADDRESS', value: 'Near Pagnis Paga, Juni Indore, 452001')
ApplicationSetting.create(key: 'CONTACT_EMAIL', value: 'Fightrixclub@gmail.com')
ApplicationSetting.create(key: 'PHONE_NUMBER', value: '(+91) 966-969-6692, 966-969-6681, 966-969-6633')
ApplicationSetting.create(key: 'ALLOWED_EMAILS', value: 'akshayjain813@gmail.com')
