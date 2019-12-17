# frozen_string_literal: true

require "rails_helper"

describe "GET /users/pdfs" do
  subject do
    get users_pdfs_path
  end

  context "1ページのみの場合" do
    before do
      create_list(:user, 5)
    end

    it "指定の内容のPDFが出力されること" do
      subject
      expect(response).to have_http_status(200)
      expect(response.headers["Content-Disposition"]).to include("filename=ユーザー一覧.pdf")
      expect(response.body).to match_pdf_snapshot("single_page_user_list")
    end
  end

  context "複数ページの場合" do
    before do
      create_list(:user, 99)
    end

    it "指定の内容のPDFが出力されること" do
      subject
      expect(response).to have_http_status(200)
      expect(response.headers["Content-Disposition"]).to include("filename=ユーザー一覧.pdf")
      expect(response.body).to match_pdf_snapshot("multi_page_user_list")
    end
  end
end
