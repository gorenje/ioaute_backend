# avoid loading issues having this plugin loaded first ...
require "#{Rails.root}/app/controllers/publications_controller.rb"

%w(
  publications_controller_extensions
).each { |a| require File.dirname(__FILE__) + "/#{a}.rb" }

PublicationsController.send(:include, EditorApi::PublicationsControllerExtensions)
