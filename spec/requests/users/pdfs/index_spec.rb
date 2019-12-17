# frozen_string_literal: true

require "rails_helper"

describe "GET /users/pdfs" do
  subject do
    get users_pdfs_path
  end

  before do
    create_list(:user, 5)
  end

  it "指定の内容のPDFが出力されること" do
    subject
    expect(response).to have_http_status(200)
    expect(response.headers["Content-Disposition"]).to include("filename=ユーザー一覧.pdf")
    expect(response.body).to match_pdf_snapshot("user_list")
  end
end
