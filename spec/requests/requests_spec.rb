require 'swagger_helper'

RSpec.describe 'requests', type: :request do

  path '/requests' do

    get('list requests') do
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

    post('create request') do
      response(200, 'successful') do
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              category: { type: :string },
              status: { type: :string },
              urgency: { type: :string },
              user_id: { type: :integer },
              asset_id: { type: :integer },
              quantity: { type: :integer }
            },
            required: %w[name category status urgency user_id asset_id quantity]
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

  path '/requests/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show request') do
      response(200, 'successful') do
        let(:id) { '123' }

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

    patch('update request') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              category: { type: :string },
              status: { type: :string },
              urgency: { type: :string },
              user_id: { type: :integer },
              asset_id: { type: :integer },
              quantity: { type: :integer }
            },
            required: %w[name category status urgency user_id asset_id quantity]
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

    put('update request') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              category: { type: :string },
              status: { type: :string },
              urgency: { type: :string },
              user_id: { type: :integer },
              asset_id: { type: :integer },
              quantity: { type: :integer }
            },
            required: %w[name category status urgency user_id asset_id quantity]
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

    delete('delete request') do
      response(200, 'successful') do
        let(:id) { '123' }

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
