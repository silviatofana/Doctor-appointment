require 'swagger_helper'
require 'faker'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('list doctors') do
      response(200, 'successful') do
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

    post('create doctor') do
      response(401, 'successful') do
        parameter({
                    in: :header,
                    type: :string,
                    name: :Authorization,
                    required: true,
                    description: 'Client token'
                  })

        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }

        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            bio: { type: :string },
            specialization: { type: :string },
            photo: { type: :string },
            gender: { type: :string },
            avaliability: { type: :string }
          },
          required: %w[name specialization photo gender]
        }

        let(:doctor) do
          Doctor.create(name: 'Solo Boss', bio: 'Good doctor!', specialization: 'Oncologist', photo: 'http://localhost/pic.png',
                        gender: 'M', avaliability: 'Y')
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

  path '/api/v1/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show doctor') do
      response(200, 'successful') do
        let(:id) do
          Doctor.create(name: 'Solo Boss', bio: 'Good doctor!', specialization: 'Oncologist', photo: 'http://localhost/pic.png',
                        gender: 'M', avaliability: 'Y').id
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

    put('update doctor') do
      response(401, 'successful') do
        parameter({
                    in: :header,
                    type: :string,
                    name: :Authorization,
                    required: true,
                    description: 'Client token'
                  })

        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }

        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            bio: { type: :string },
            specialization: { type: :string },
            photo: { type: :string },
            gender: { type: :string },
            avaliability: { type: :string }
          },
          required: %w[name specialization photo gender]
        }

        let(:doctor) do
          Doctor.create(name: 'Solo Boss', bio: 'Good doctor!', specialization: 'Oncologist', photo: 'http://localhost/pic.png',
                        gender: 'M', avaliability: 'Y')
        end

        let(:id) do
          Doctor.create(name: 'Solo Boss', bio: 'Good doctor!', specialization: 'Oncologist', photo: 'http://localhost/pic.png',
                        gender: 'M', avaliability: 'Y').id
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

    delete('delete doctor') do
      response(401, 'successful') do
        parameter({
                    in: :header,
                    type: :string,
                    name: :Authorization,
                    required: true,
                    description: 'Client token'
                  })

        security [Authorization: {}]
        let(:Authorization) { 'Authorization generate_token' }

        let(:id) do
          Doctor.create(name: 'Solo Boss', bio: 'Good doctor!', specialization: 'Oncologist', photo: 'http://localhost/pic.png',
                        gender: 'M', avaliability: 'Y').id
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
