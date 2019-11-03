# frozen_string_literal: true

class UserPdfBuilder
  def initialize(users)
    @users = users
    @renderer = ApplicationController.renderer.new
  end

  def build(page_size = "A4")
    PDFKit.new(
      @renderer.render(
        template: template_path,
        assigns: { users: @users },
      ),
      page_size: page_size,
    ).to_pdf
  end

  def options
    encoded = URI.encode_www_form_component(filename)
    {
      filename: ERB::Util.url_encode(filename),
      type: "application/pdf",
      disposition: "attachment; filename=#{filename}; filename*=UTF-8''#{encoded}",
    }
  end

  private
  def template_path
    "users/pdfs/index.pdf"
  end

  def filename
    "ユーザー一覧.pdf"
  end
end
