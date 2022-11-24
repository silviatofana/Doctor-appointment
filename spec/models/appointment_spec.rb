require 'rails_helper'

RSpec.describe Appointment, type: :model do
    subject do
        user = User.create(name: 'Solo Boss', password: '123456', email: 'soloboss@gmail.com', role: 'admin', password_confirmation: '123456', gender: 'M')
        doctor = Doctor.create(name: 'Silvia', photo: 'https://icon.com/icon.jpg', specialization: 'Cardiologist',
                               gender: 'F', avaliability: 'Y', bio: 'good doctor')
        Appointment.new(description: 'head ache', user:, doctor:, date_of_appointment: '2021-01-01',
                        time_of_appointment: '10:00')
      end

      before { subject.save }
end