class DemoController < ApplicationController
  def show
    uuid = params[:uuid]
    @person = Person.find_by_uuid(uuid) if uuid
    if @person
      render action: 'show',layout: 'without_menu'
    else
      render action: 'scan', layout: 'without_menu'
    end
  rescue
    render action: 'scan', layout: 'without_menu'
  end
end
