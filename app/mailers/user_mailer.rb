# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: "admin@usersretrieverapp.com"

  def user_deleted_email(name, email)
    @name = name
    mail(to: email, subject: "Your account was deleted")
  end
end
