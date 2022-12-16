# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: "Dr. Johnie Carson", email: 'jcarson@gmail.com', gender: 'M', password: '123456', password_confirmation: '123456', role: 'admin')

Doctor.create(name: "Dr. Andrew Bile", specialization: 'Oncologist', avaliability: 'Y',
photo: 'dr_andrew_bile.png', gender: 'M')
Doctor.create(name: "Dr. Anne Zawadi", specialization: 'Cardiologist', avaliability: 'Y',
photo: 'dr_anne_zawadi.png', gender: 'F')
Doctor.create(name: "Dr. Mark Xaverian", specialization: 'Surgeon', avaliability: 'Y',
photo: 'dr_mark_x.png', gender: 'M')
Doctor.create(name: "Dr. Rawal Parag", specialization: 'Oncologist', avaliability: 'Y',
photo: 'dr_rawal_parag.png', gender: 'M')