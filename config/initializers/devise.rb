# frozen_string_literal: true

Devise.setup do |config|
  config.omniauth :facebook,
                  '640140566337303',
                  '663582a5c3b59fa4d6cd523287c640da',
                  scope: 'email',
                  callback_url: "http://localhost:3000/users/auth/facebook/callback"
  config.omniauth :google_oauth2, 
                  '763838365991-oc5b5s5jsrhndpu45qjv2b4qo8cp997p.apps.googleusercontent.com', 
                  'XNe9wn39_RZmhCZj_8qhqLuN',
                  scope: "email,profile,offline", 
                  prompt: "consent"
  config.mailer_sender = 'please-change-me-at-config-initializers-devise
  @example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
