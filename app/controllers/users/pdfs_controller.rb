# frozen_string_literal: true

class Users::PdfsController < ApplicationController
  def index
    @users = User.all
    builder = UserPdfBuilder.new(@users)
    send_data(builder.build, builder.options)
  end
end
