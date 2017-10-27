require 'rails_helper'

describe Message, type: :model  do
  describe '#create' do

    context 'When there is a valid value' do
      it "is valid without a body" do
        message = build(:message, body: "")
        expect(message).to be_valid
      end

      it "is valid without a image" do
        message = build(:message, image: "")
        expect(message).to be_valid
      end

      it "is valid without body & image" do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'When there is no valid value' do
      it "is invalid without a body" do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:image]).to include("を入力してください")
      end

      it "is invalid without group_id" do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")

      end

      it "is invalid without a user_id" do
        message = build(:message, user_id: "")
        message.valid?
         expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end

end
