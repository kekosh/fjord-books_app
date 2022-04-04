# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  # リクエストのたびにURIにロケールを追加するようにする
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # ロケール情報を自動的にクエリに含むようにする
  def default_url_options
    { locale: I18n.locale }
  end
end
