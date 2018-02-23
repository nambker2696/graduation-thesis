require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Food
  # :nodoc: comment
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.load_path +=
      Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.middleware.use I18n::JS::Middleware
    config.i18n.available_locales = %i[en vi ja]
    config.assets.initialize_on_precompile = false
  end
end
