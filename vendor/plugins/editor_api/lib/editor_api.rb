%w(
  publications_controller_extensions
).each { |a| require File.dirname(__FILE__) + "/#{a}.rb" }

PublicationsController.send(:include, EditorApi::PublicationsControllerExtensions)
