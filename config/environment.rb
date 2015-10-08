# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ShoYu::Application.initialize!

WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&lt 前へ'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '次へ &gt'