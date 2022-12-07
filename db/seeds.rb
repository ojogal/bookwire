# frozen_string_literal: true

Payment.delete_all
Booking.delete_all
User.delete_all
Currency.delete_all
BookingStatus.delete_all
Role.delete_all
Unit.delete_all
BookingUnit.delete_all
UserBrand.delete_all
Branch.delete_all
Brand.delete_all
Location.delete_all
UnitType.delete_all
Category.delete_all

role1 = Role.create title: 'admin'
role2 = Role.create title: 'owner'
role3 = Role.create title: 'manager'
role4 = Role.create title: 'customer'

bstatus1 = BookingStatus.create title: 'reserved', description: 'booking description'
bstatus2 = BookingStatus.create title: 'not reserved', description: 'booking description'

cur1 = Currency.create number: 100, symbol: 'EUR', code: 'avadakedavra'
cur2 = Currency.create number: 100, symbol: 'USD', code: 'avadakedavra'
cur3 = Currency.create number: 100, symbol: 'MDL', code: 'avadakedavra'

category1 = Category.create title: 'restaurant'
category2 = Category.create title: 'cafe'
category3 = Category.create title: 'hall'

location1 = Location.create(
  country: 'Moldova, Republic of',
  city: 'Chisinau',
  street: 'Pushkin str.',
  building: '15'
)

location2 = Location.create(
  country: 'Moldova, Republic of',
  city: 'Chisinau',
  street: 'Pushkin str.',
  building: '16'
)

location3 = Location.create(
  country: 'Moldova, Republic of',
  city: 'Chisinau',
  street: 'Pushkin str.',
  building: '17'
)

utype1 = UnitType.create title: 'table', description: 'zis is tabol'
utype2 = UnitType.create title: 'floor', description: 'zis is floor'
utype3 = UnitType.create title: 'establishment', description: 'zis is whole place'

user1 = User.create(
  first_name: 'Alexandr',
  last_name: 'Kozhukhar',
  phone: '000-00-0',
  email: 'kozhukhargay@mail.com',
  role_id: role1.id
)

user2 = User.create(
  first_name: 'Alexandr',
  last_name: 'Golovin',
  phone: '100-00-0',
  email: 'etomoihram@mail.com',
  role_id: role2.id
)

user3 = User.create(
  first_name: 'Angelina',
  last_name: 'Kozhukhar',
  phone: '200-00-0',
  email: 'kitchenforbitchin@mail.com',
  role_id: role3.id
)

user4 = User.create(
  first_name: 'Alexandr',
  last_name: 'Ojog',
  phone: '300-00-0',
  email: 'dominator228@mail.com',
  role_id: role4.id
)

brand1 = Brand.create title: 'Tucano', category_id: category1.id
brand2 = Brand.create title: 'Donuts & Coffee', category_id: category2.id
brand3 = Brand.create title: 'Fire in the Hall', category_id: category3.id

branch1 = Branch.create(
  alias: 'Paradise and coffee',
  floors: 1,
  brand_id: brand1.id,
  location_id: location1.id
)

branch2 = Branch.create(
  alias: 'Not paradise and coffee',
  floors: 2,
  brand_id: brand2.id,
  location_id: location2.id
)

branch3 = Branch.create(
  alias: 'Almost paradise and coffee',
  floors: 3,
  brand_id: brand3.id,
  location_id: location3.id
)

unit1 = Unit.create seats: 4, floor: 1, unit_type_id: utype1.id, branch_id: branch1.id
unit2 = Unit.create seats: 4, floor: 2, unit_type_id: utype2.id, branch_id: branch2.id
unit3 = Unit.create seats: 4, floor: 3, unit_type_id: utype3.id, branch_id: branch3.id

book1 = Booking.create(
  starts_at: Time.zone.now,
  ends_at: Time.zone.now,
  user_id: user1.id,
  booking_status_id: bstatus2.id
)

book2 = Booking.create(
  starts_at: Time.zone.now,
  ends_at: Time.zone.now,
  user_id: user2.id,
  booking_status_id: bstatus2.id
)

book3 = Booking.create(
  starts_at: Time.zone.now,
  ends_at: Time.zone.now,
  user_id: user3.id,
  booking_status_id: bstatus2.id
)

pay1 = Payment.create amount: 100.50, currency_id: cur1.id, booking_id: book1.id
pay2 = Payment.create amount: 100.50, currency_id: cur2.id, booking_id: book2.id
pay3 = Payment.create amount: 100.50, currency_id: cur3.id, booking_id: book3.id

bunit1 = BookingUnit.create booking_id: book1.id, unit_id: unit1.id
bunit2 = BookingUnit.create booking_id: book2.id, unit_id: unit2.id
bunit3 = BookingUnit.create booking_id: book3.id, unit_id: unit3.id

user1.brands << [brand1]
user2.brands << [brand2]
user3.brands << [brand3]
