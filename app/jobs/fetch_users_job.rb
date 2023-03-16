# frozen_string_literal: true

class FetchUsersJob < ApplicationJob
  queue_as :default

  def perform
    puts "Hey, it was performed!"
  end
end
