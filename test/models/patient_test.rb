# frozen_string_literal: true

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  def setup; end

  def teardown; end

  test 'create patient' do
    assert create(:patient)
  end
end