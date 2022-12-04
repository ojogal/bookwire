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

cur1 = Currency.create number: 100, symbol: 'EUR', code: 'avadakedavra'
bstatus1 = BookingStatus.create title: 'booking status', description: 'booking description'
role1 = Role.create title: 'Owner'
category1 = Category.create title: 'restaurant'
location1 = Location.create country: 'Moldova, Republic of', state: 'N/A', city: 'Chisinau', street: 'Pushkin str.', building: '15'
utype1 = UnitType.create title: 'table', description: 'zis is tabol'
user1 = User.create first_name: 'Alexandr', last_name: 'Golovin', phone: '000-00-0', email: 'etomoihram@mail.com', role_id: role1.id
brand1 = Brand.create title: 'Donuts & Coffee', category_id: category1.id
branch1 = Branch.create alias: 'Paradise and coffee', floors: 5, brand_id: brand1.id, location_id: location1.id
unit1 = Unit.create seats: 4, floor: 1, unit_type_id: utype1.id, branch_id: branch1.id
book1 = Booking.create starts_at: Time.now, ends_at: Time.now, user_id: user1.id, booking_status_id: bstatus1.id
pay1 = Payment.create amount: 100.50, currency_id: cur1.id, booking_id: book1.id
# bunit1 = BookingUnit.create booking_id: book1.id, unit_id: unit1.id
# ubrand1 = UserBrand.create user_id: user1.id, brand: brand1.id

# user1.brands << [brand1]
# unit1.bookings << [book1]
 