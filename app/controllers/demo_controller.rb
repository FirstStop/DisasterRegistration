class DemoController < ApplicationController
  def show
    uuid = params[:uuid]
    if uuid
      @person = Person.find_by_uuid(uuid)
    end
    render layout: 'without_menu'
  end
end
