# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }

    context "without a name" do
      it "is not valid" do
        user = User.new(email: FFaker::Internet.email)
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "without an email" do
      it "is not valid" do
        user = User.new(name: FFaker::Name.name)
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context "when it's a duplicated email" do
      let!(:user) { create(:user, email: "xavier@noria.com") }

      it "is not valid" do
        user = User.new(email: "xavier@noria.com")
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
