# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  def login
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  # ログインできること
  test 'login' do
    login
    assert_text 'ログインしました。'
  end

  # 日報が登録できること
  test 'can_create_new_report' do
    login
    click_link '日報'
    assert_selector 'h1', text: '日報'

    click_link '新規作成'
    assert_selector 'h1', text: '日報の新規作成'

    fill_in 'タイトル', with: '１日目の日報のタイトル'
    fill_in '内容', with: '１日目の日報の内容'
    click_on '登録する'
    assert_text '日報が作成されました。'

    # 登録したデータの結果確認
    assert_text '１日目の日報のタイトル'
    assert_text '１日目の日報の内容'
  end

  # 日報の編集ができること
  test 'report_editable' do
    login
    click_link '日報'
    click_link '編集'
    fill_in 'タイトル', with: '１日目の日報のタイトル（編集後）'
    fill_in '内容', with: '１日目の日報の内容（編集後）'
    click_button '更新する'
    assert_text '日報が更新されました。'

    # 編集したデータの結果確認
    assert_text '１日目の日報のタイトル（編集後）'
    assert_text '１日目の日報の内容（編集後）'
  end

  # 日報にコメントが投稿できること
  test 'commentable_on_report' do
    login
    click_link '日報'
    first('tbody tr').click_link '詳細'
    fill_in 'comment_content', with: '確認しました。'
    click_on 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text '確認しました。'
  end

  # 日報を削除できること
  test 'report_can_delete' do
    login
    click_link '日報'
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'

    assert_no_text('alice no 1st day')
  end
end
