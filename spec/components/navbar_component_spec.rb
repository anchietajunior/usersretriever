# frozen_string_literal: true

require "rails_helper"

RSpec.describe NavbarComponent, type: :component do
  it "renders the navbar with the application title" do
    expect(
      render_inline(described_class.new(title: "Users Retriever App")).to_html
    ).to include(
      "Users Retriever App"
    )
  end
end
