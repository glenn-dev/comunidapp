# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Building.destroy_all
Department.destroy_all
Bill.destroy_all
ExpensesDetail.destroy_all
User.destroy_all
UserType.destroy_all
Communication.destroy_all
Concept.destroy_all

sup = UserType.create(name: "SuperAdmin")
adm = UserType.create(name: "Admin")
pro = UserType.create(name: "Propietario")
res = UserType.create(name: "Residente")

corp = Building.create(name: "Base", address: "Direccion Base")
base = Department.create(num_dep: "Base", floor: "piso_base", defaulting: false, habitability: true, collection: 0, building_id: corp.id)
User.create(name: "Glenn", email: "glenn.marcano90@gmail.com", password: "123456", phone: "23456789", department_id: base.id, user_type_id: sup.id)

5.times do |i|
  Concept.create(name: "Concept_#{i}")
  b = Building.create(name: "Building_#{i}", address: "Address_building_#{i}")
  o = Department.create(num_dep: "Oficina edificio #{i}", floor: "1", defaulting: false, habitability: true, building_id: b.id, collection: 0)
  User.create(name: "Admin_#{i}", email: "admin#{i}@gmail.com", password: "123456", phone: "23456789", department_id: o.id, user_type_id: adm.id)
  10.times do |j|
      c = Communication.create(num_release: "#{j}", title: "Title_#{j}", content: "Communication_content_#{j}", status: true, building_id: b.id)
      d = Department.create(num_dep: "#{j}", floor: "#{i + j}", defaulting: false, habitability: true, building_id: b.id, collection: 0.1)
      User.create(name: "user_name_#{i}", email: "mail#{i}#{j}@gmail.com", password: "123456", phone: "23456789", department_id: d.id, user_type_id: res.id)
  end
end