# frozen_string_literal: true

class Users::PdfsController < ApplicationController
  def index
    @users = User.all
    html = render_to_string(template: "users/pdfs/index.pdf")
    pdf = PDFKit.new(html)
    
    filename = "ユーザー一覧.pdf"
    encoded = URI.encode_www_form_component(filename)
    send_data(pdf.to_pdf, {
      filename: ERB::Util.url_encode(filename),
      type: "application/pdf",
      disposition: "attachment; filename=#{filename}; filename*=UTF-8''#{encoded}",
    })
  end
end
