require 'spec_helper'

describe AdminPagesController do
  include Devise::TestHelpers

  context 'not logged in' do
    describe '#dashboard' do
      it 'redirects to sign in' do
        get :dashboard
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'logged in' do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    specify { expect(get :dashboard).to be_success }
    specify { expect(get :settings).to be_success }
  end

end
