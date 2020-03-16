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
User.create(name: "Glenn", email: "glenn.marcano90@gmail.com", password: "123456", phone: "23456789", building_id: corp.id, department_id: base.id, user_type_id: sup.id)

5.times do |i|
  building = Building.create(name: "Building_#{i}", address: "Address_building_#{i}")
  office = Department.create(num_dep: "Oficina edificio #{i}", floor: "1", defaulting: false, habitability: true, building_id: building.id, collection: 0)
  User.create(name: "Admin_#{i}", email: "admin#{i}@gmail.com", password: "123456", phone: "23456789", building_id: building.id, department_id: office.id, user_type_id: adm.id)
  
  10.times do |j|
    department = Department.create(num_dep: "#{i}#{j}", floor: "#{j}#{i}", defaulting: false, habitability: true, building_id: building.id, collection: 0.1)
    concept = Concept.create(name: "Concept_#{i}#{j}")
    Communication.create(num_release: "#{i}#{j}", title: "Title_#{i}#{j}", content: "Communication_content_#{i}#{j}", status: true, building_id: building.id)
    User.create(name: "user_name_#{i}#{j}", email: "mail#{i}#{j}@gmail.com", password: "123456", phone: "23456789", building_id: building.id, department_id: department.id, user_type_id: res.id)
    GeneralExpense.create(amount: 500000, status: true, concept_id: concept.id, building_id: building.id)
    5.times do |k|
      bill_true = Bill.create(num_bill: "#{i}#{j}#{k}", total: 100000, status: true, department_id: department.id, building_id: building.id)
      bill_false = Bill.create(num_bill: "#{i}#{j}#{k + 20}", total: 100000, status: false, department_id: department.id, building_id: building.id)
      5.times do |l|
        ExpensesDetail.create(amount: 50000, concept_id: concept.id, bill_id: bill_true.id, expenses_type: true)
        ExpensesDetail.create(amount: 50000, concept_id: concept.id, bill_id: bill_false.id, expenses_type: true)
      end
    end
  end
end