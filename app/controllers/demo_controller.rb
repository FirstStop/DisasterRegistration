class DemoController < ApplicationController
  def show
    uuid = params[:uuid]
    if uuid
      @person = Person.find_by_uuid(uuid)
      render action: 'show',layout: 'without_menu'
    else
      render action: 'scan', layout: 'without_menu'
    end

  end
end
