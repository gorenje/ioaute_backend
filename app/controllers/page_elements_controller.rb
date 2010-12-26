class PageElementsController < ApplicationController
  def create
    send_off_status(200, "ok")
  end
end
