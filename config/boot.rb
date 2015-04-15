# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

##
# ## Enable devel logging
Padrino::Logger::Config[:development][:log_level]  = :devel
Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  # Add `app_root` and `app_root/lib` to the load path.
  [Padrino.root, Padrino.root('lib')].each do |additional_path|
    $:.unshift additional_path unless $:.include? additional_path
  end

  Dir.glob(File.join Padrino.root, 'config', 'initializers', '**', '*').each do |file|
    Padrino.logger.devel "loading initializer: #{file}"
    require file
  end
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
