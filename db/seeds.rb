# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

['SHA256', 'Scrypt', 'Scrypt-N', 'X11', 'X13', 'X15', 'Keccak', 'Quark',
  'Groestl', 'JHA', 'Blake-256', 'NeoScrypt', 'CryptoNight'].each do |algo|
  AlgoType.find_or_create_by({name: algo})
end

['KH/s', 'MH/s', 'GH/s'].each do |speed|
  HashSpeed.find_or_create_by({speed: speed})
end