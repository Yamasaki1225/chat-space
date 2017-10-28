require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message) }
  let(:messages){ build(:message) }


  describe 'GET #index' do
    context 'login' do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested group to @message" do
        expect(assigns(:message)).to be_a_new Message
      end

      it "assigns the requested contact to @groups" do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'not login' do
      it "redirects to_user_session_path" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

  describe 'POST #create' do

    context 'user_login' do
      before do
        login_user user
      end

      it "is saved on Data Base" do
        expect do
          post :create, params: { group_id: group, message: attributes_for(:message) }
         end.to change(Message, :count).by(1)
       end

      it "renders the :index template" do
        post :create, params: { group_id: group, message: attributes_for(:message)}
        expect(response).to redirect_to group_messages_path(group)
      end

      it "is not saved on Data Base although user_rogin" do
      expect do
        post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) }

      end.to change(Message, :count).by(0)
      end

      it "renders the :index template" do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path(group)
      end
    end

     context 'user_logout' do
       it "redirect_to new_user_session_path" do
       post :create, params: { group_id: group, message: attributes_for(:message) }
       expect(response).to redirect_to(new_user_session_path)
       end
     end
  end
end
