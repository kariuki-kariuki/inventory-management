require 'swagger_helper'

RSpec.describe 'assets', type: :request do

  path '/assets' do

    get('list assets') do
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

    post('create asset') do
      response(200, 'successful') do
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              user_id: { type: :integer },
              category: { type: :string },
              description: { type: :string},
              status: { type: :boolean}
        },
       required: %w[name user_id category description status]
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

  path '/assets/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show asset') do
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

    patch('update asset') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              user_id: { type: :integer },
              category: { type: :string },
              description: { type: :string},
              status: { type: :boolean}
        },
       required: %w[name user_id category description status]
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

    put('update asset') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json', 'application/xml'
        parameter name: :asset, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              user_id: { type: :integer },
              category: { type: :string },
              description: { type: :string},
              status: { type: :boolean}
        },
       required: %w[name user_id category description status]
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

    delete('delete asset') do
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

  path '/myassets' do

    get('my_assets asset') do
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
  end
end
