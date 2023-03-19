# frozen_string_literal: true

module Users
  module Organizers
    class FetchAndCreate
      include Interactor::Organizer

      # Acceptable arguments for this Class
      # skip = Integer
      # limit = Integer

      before do
        # This URL probably should be in a ENV variable for security reasons.
        # Skip and Limit params also could be in ENV variables to be totally configurable.

        # binding.irb

        context.api_response = HTTParty.get(
          "https://dummyjson.com/users?skip=#{context.skip}&limit=#{context.limit}"
        )
      end

      organize(
        Users::Interactors::CreateUsers,
        Users::Interactors::FetchNextUsers
      )
    end
  end
end
