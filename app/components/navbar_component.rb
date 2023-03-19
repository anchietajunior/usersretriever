# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
