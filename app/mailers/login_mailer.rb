# frozen_string_literal: true

class LoginMailer < ApplicationMailer
  def login_link(user)
    @user = user
    mail to: user.email, subject: 'Innlogging for House of Nerds'
  end
end
