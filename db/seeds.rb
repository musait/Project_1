# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

IdentificationNumber.create(id_number:"787643251")
IdentificationNumber.create(id_number:"787564372")
IdentificationNumber.create(id_number:"787086437")
IdentificationNumber.create(id_number:"787327483")
IdentificationNumber.create(id_number:"787954623")
IdentificationNumber.create(id_number:"787864735")
IdentificationNumber.create(id_number:"787777777")



Position.create(name: "CQ")
Position.create(name: "ETL")
Position.create(name: "RD")
Position.create(name: "RVP")
Position.create(name: "SVP")



User.create(email:"admin@admin.com",lastname:"admin", surname:"admin", id_number:"787777777",password:"password",password_confirmation:"password", admin:"true")
