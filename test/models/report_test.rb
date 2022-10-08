# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "should edit only own report" do
    alice = User.create(id:1, name:"alice", email:"alice@example.com", password:"password")
    alice_report = Report.create(user_id:1, title:"1st report", content:"Im alice")
    bob_report = Report.create(user_id:2, title:"1st report", content:"Im bob")

    assert alice_report.editable?(alice)
    assert_not bob_report.editable?(alice)

  end
end
