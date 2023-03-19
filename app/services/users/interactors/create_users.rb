# frozen_string_literal: true

module Users
  module Interactors
    class CreateUsers
      include Interactor

      delegate :api_response, to: :context

      def call
        return if users_data.blank?

        users_data.each do |user|
          User.create!(
            build_user_params(user.with_indifferent_access)
          )
        end
      end

      private

      def build_user_params(user)
        {}.tap do |hash|
          hash[:name] = "#{user[:firstName]} #{user[:lastName]}"
          hash[:email] = user[:email]
          hash[:phone] = user[:phone]
          hash[:gender] = user[:gender]
          hash[:height] = user[:height]
          hash[:weigth] = user[:weigth]
          hash[:birthdate] = Date.parse(user[:birthDate])
          hash[:image] = user[:image]
          hash[:university] = user[:university]
        end
      end

      def users_data
        api_response["users"]
      end
    end
  end
end
