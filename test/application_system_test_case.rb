# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Webdrivers::Chromedriver.required_version = '106.0.5249.21'
  driven_by :selenium, using: :chrome, screen_size: [1000, 800]
end
