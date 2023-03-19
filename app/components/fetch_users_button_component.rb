# frozen_string_literal: true

class FetchUsersButtonComponent < ViewComponent::Base
  def initialize
    @users_not_yet_fetched = User.count.zero?
  end
end
