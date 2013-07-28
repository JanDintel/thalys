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
    let(:a_post) { FactoryGirl.create(:post) }
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

    describe '#edit' do
      it 'edits a post' do
        get :edit, id: a_post.id
        expect(response).to be_success
      end
    end

    describe '#update' do
      it 'updates a post' do
        patch :edit, id: a_post.id, post: { title: 'different', content: 'changed.' }
        expect(response).to be_success
      end
    end

    describe '#destroy' do
      it 'deletes a post' do
        delete :destroy, id: a_post.id
        expect(Post.count).to be 0
      end
    end
  end
end
