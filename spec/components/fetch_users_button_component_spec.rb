# frozen_string_literal: true

require "rails_helper"

RSpec.describe FetchUsersButtonComponent, type: :component do
  context "when the users are not fetched yet" do
    it "renders the fetch users button" do
      expect(
        render_inline(described_class.new).to_html
      ).to include(
        "Fetch Users"
      )
    end
  end

  context "when the users need to be fetched" do
    let!(:user) { create(:user) }

    it "does not render the fetch users button" do
      expect(
        render_inline(described_class.new).to_html
      ).to_not include(
        "Fetch Users"
      )
    end
  end
end
