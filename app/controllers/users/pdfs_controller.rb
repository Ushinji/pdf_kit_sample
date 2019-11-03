# frozen_string_literal: true

class Users::PdfsController < ApplicationController
  def index
    @users = User.all
    html = render_to_string(template: "users/pdfs/index.pdf")
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf, {
      filename: "ユーザー一覧.pdf",
      type: "application/pdf",
      disposition: "inline",
    })
  end
end
