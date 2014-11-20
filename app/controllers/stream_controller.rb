class StreamController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all
    render action: :index, layout: 'without_menu'
  end
end
