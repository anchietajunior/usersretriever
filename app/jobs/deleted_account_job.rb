# frozen_string_literal: true

class DeletedAccountJob < ApplicationJob
  queue_as :default

  def perform(name, email)
    UserMailer.user_deleted_email(name, email).deliver_now
  end
end
