# frozen_string_literal: true

module Users
  module Organizers
    class Search
      include Interactor::Organizer

      # Acceptable arguments for this Class
      # search = String

      organize(
        Users::Interactors::SearchByNameOrEmail
      )
    end
  end
end
