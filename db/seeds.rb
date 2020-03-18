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
  building = Building.create(name: "Building_#{i + 1}", address: "Address_building_#{i + 1}")
  office = Department.create(num_dep: "Oficina edificio #{i + 1}", floor: "1", defaulting: false, habitability: true, building_id: building.id, collection: 0)
  User.create(name: "Admin_#{i + 1}", email: "admin#{i + 1}@gmail.com", password: "123456", phone: "23456789", building_id: building.id, department_id: office.id, user_type_id: adm.id)
  
  10.times do |j|
    department = Department.create(num_dep: "#{i}#{j + 1}", floor: "#{j}#{i +1}", defaulting: false, habitability: true, building_id: building.id, collection: 0.1)
    concept = Concept.create(name: "Concepto #{i}#{j}", building_id: building.id )
    Communication.create(num_release: "#{i}#{j + 1}", title: "Title_#{i}#{j + 1}", content: "Contenido de la comunicacion #{i}#{j + 1}", status: true, building_id: building.id)
    User.create(name: "user_name_#{i}#{j + 1}", email: "user#{i}#{j + 1}@gmail.com", password: "123456", phone: "23456789", building_id: building.id, department_id: department.id, user_type_id: res.id)
    GeneralExpense.create(amount: 500000, status: true, concept_id: concept.id, building_id: building.id)
    
    3.times do |k|
      bill_true = Bill.create(num_bill: "#{i}#{j}#{k + 1}", total: 100000, status: true, department_id: department.id, building_id: building.id)
      bill_false = Bill.create(num_bill: "#{i}#{j}#{k + 21}", total: 100000, status: false, department_id: department.id, building_id: building.id)
      
      5.times do |l|
        ExpensesDetail.create(amount: 50000, concept_id: concept.id, bill_id: bill_true.id, expenses_type: true, building_id: building.id)
        ExpensesDetail.create(amount: 50000, concept_id: concept.id, bill_id: bill_false.id, expenses_type: true, building_id: building.id)
      end

    end

  end
  
end