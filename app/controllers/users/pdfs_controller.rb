# frozen_string_literal: true

class Users::PdfsController < ApplicationController
  def index
    @users = User.all
    builder = UserPdfBuilder.new(@users)
    send_data(builder.build(params[:page_size]), builder.options)
  end
end
