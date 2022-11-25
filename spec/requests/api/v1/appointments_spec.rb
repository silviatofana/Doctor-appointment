require 'swagger_helper'
require 'faker'

RSpec.describe 'api/v1/appointments', type: :request do
  path '/api/v1/users/{user_id}/appointments' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list appointments') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })
      response(401, 'successful') do
        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }
        let(:user_id) do
          User.create(name: 'Felix Ouma', gender: 'M', email: Faker::Internet.email, password: '123456',
                      password_confirmation: '123456', role: 'admin').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create appointment') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })
      response(401, 'successful') do
        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }
        let(:user_id) do
          User.create(name: 'Silvia Romania', gender: 'F', email: Faker::Internet.email, password: '123456',
                      password_confirmation: '123456', role: 'admin').id
        end
        let(:doctor_id) do
          Doctor.create(name: 'Silvia', photo: 'https://icon.com/icon.jpg', specialization: 'Cardiologist',
                        gender: 'F', avaliability: 'Y', bio: 'good doctor').id
        end

        let(:id) do
          Appointment.create(description: 'head ache', user_id:, doctor_id:, date_of_appointment: '2021-01-01',
                             time_of_appointment: '10:00').id
        end

        parameter name: :appointment, in: :body, schema: {
          type: :object,
          properties: {
            date_of_appointment: { type: :string },
            time_of_appointment: { type: :string },
            description: { type: :string },
            user_id: { type: :string },
            doctor_id: { type: :string }
          },
          required: %w[date_of_appointment time_of_appointment description user_id doctor_id]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/appointments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show appointment') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })

      response(200, 'successful') do
        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }
        let(:user_id) do
          User.create(name: 'Felix Ouma', gender: 'M', email: Faker::Internet.email, password: '123456',
                      password_confirmation: '123456', role: 'admin').id
        end
        let(:doctor_id) do
          Doctor.create(name: 'Silvia', photo: 'https://icon.com/icon.jpg', specialization: 'Cardiologist',
                        gender: 'F', avaliability: 'Y', bio: 'good doctor').id
        end

        let(:id) do
          Appointment.create(description: 'head ache', user_id:, doctor_id:, date_of_appointment: '2021-01-01',
                             time_of_appointment: '10:00').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update appointment') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })
      response(401, 'successful') do
        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }

        parameter name: :appointment, in: :body, schema: {
          type: :object,
          properties: {
            date_of_appointment: { type: :string },
            time_of_appointment: { type: :string },
            description: { type: :string },
            user_id: { type: :string },
            doctor_id: { type: :string }
          },
          required: %w[date_of_appointment time_of_appointment description user_id doctor_id]
        }

        let(:user_id) do
          User.create(name: 'Felix Ouma', gender: 'M', email: Faker::Internet.email, password: '123456',
                      password_confirmation: '123456', role: 'admin').id
        end
        let(:doctor_id) do
          Doctor.create(name: 'Silvia', photo: 'https://icon.com/icon.jpg', specialization: 'Cardiologist',
                        gender: 'F', avaliability: 'Y', bio: 'good doctor').id
        end

        let(:id) do
          Appointment.create(description: 'head ache', user_id:, doctor_id:, date_of_appointment: '2021-01-01',
                             time_of_appointment: '10:00').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete appointment') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })
      response(401, 'successful') do
        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }
        let(:user_id) do
          User.create(name: 'Felix Ouma', gender: 'M', email: Faker::Internet.email, password: '123456',
                      password_confirmation: '123456', role: 'admin').id
        end
        let(:doctor_id) do
          Doctor.create(name: 'Silvia', photo: 'https://icon.com/icon.jpg', specialization: 'Cardiologist',
                        gender: 'F', avaliability: 'Y', bio: 'good doctor').id
        end

        let(:id) do
          Appointment.create(description: 'head ache', user_id:, doctor_id:, date_of_appointment: '2021-01-01',
                             time_of_appointment: '10:00').id
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
