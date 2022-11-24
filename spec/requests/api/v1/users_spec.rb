require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do

    get('list users') do
      response(401, 'successful') do

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

    post('create user') do
      response(200, 'successful') do
        consumes 'application/json'

        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string },
            role: { type: :string },
            gender: { type: :string },
            password: { type: :string },
            password_confirmation: { type: :string }
          },
          required: %w[name gender email password password_confirmation role]
        }
        let(:user) {
          User.create(name: 'Felix Ouma', gender: 'M', email: "#{DateTime.now}@gmail.com", password: '123456',
                      password_confirmation: '123456', role: 'admin')
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

  path '/api/v1/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      response(401, 'successful') do
        let(:id) { User.create(name: 'Felix Ouma', gender: 'M', email: "#{DateTime.now}@gmail.com", password: '123456',
        password_confirmation: '123456', role: 'admin').id }

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

  path '/api/v1/users/{id}' do
    put('update user') do
      response(403, 'successful') do
        let(:user) { User.create(name: 'Felix Ouma', gender: 'M', email: "#{DateTime.now}@gmail.com", password: '123456',
        password_confirmation: '123456', role: 'admin')}
        let(:id) { User.create(name: 'Felix Ouma', gender: 'M', email: "#{DateTime.now}@gmail.com", password: '123456',
        password_confirmation: '123456', role: 'admin').id}


        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/api/v1/auth/login' do
    post('login user') do
      response(200, 'successful') do
        consumes 'application/json'

        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          required: %w[email password]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/api/v1/users/{id}' do
    delete('delete user') do
      response(401, 'successful') do
        let(:id) { User.create(name: 'Felix Ouma', gender: 'M', email: "#{DateTime.now}@gmail.com", password: '123456',
        password_confirmation: '123456', role: 'admin').id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end
end

