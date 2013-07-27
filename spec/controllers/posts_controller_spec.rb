require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers

  context 'not logged in' do
    describe '#index' do
      it 'reponds with success' do
        get :index
        expect(response).to be_success
      end
    end

    describe '#new' do
      it 'redirects to the sign in path' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#show' do
      before { FactoryGirl.create(:post) }
      it 'responds with success' do
        get :show, id: 1
        expect(response).to be_success
      end
    end
  end

  context 'logged in' do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    describe '#new' do
      it 'reponds with success' do
        get :new
        expect(response).to be_success
      end
    end

    describe '#create' do
      it 'creates a new post' do
        post :create, post: { title: 'test', content: 'test' }
        expect(Post.count).to be 1
      end
    end
  end
end
