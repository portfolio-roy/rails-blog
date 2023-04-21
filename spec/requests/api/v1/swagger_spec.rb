require 'swagger_helper'

describe 'API V1' do
  path '/users/{user_id}/posts' do
    get 'Retrieves all posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer

      response '200', 'posts found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              content: { type: :string },
              created_at: { type: :string },
              updated_at: { type: :string }
            },
            required: [ 'id', 'title', 'content', 'created_at', 'updated_at' ]
          }

        run_test!
      end

      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieves all comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer
      parameter name: :post_id, in: :path, type: :integer

      response '200', 'comments found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              created_at: { type: :string },
              updated_at: { type: :string }
            },
            required: [ 'id', 'text', 'created_at', 'updated_at' ]
          }

        run_test!
      end

      response '404', 'post not found' do
        let(:user_id) { 'invalid' }
        let(:post_id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/posts/{post_id}/comments' do
    post 'Creates a new comment for a post' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer
      parameter name: :post_id, in: :path, type: :integer
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: [ 'text' ]
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'This is a comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: nil } }
        run_test!
      end
    end
  end
end
