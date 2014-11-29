class StreamController < ApplicationController
  def index
    @activities = PublicActivity::Activity.all
    render action: :index
  end

  def registrations
    @people = Person.where(:created_at.gt => Time.parse(params[:since]))

    respond_to do |format|
      format.json { render json: @people }
    end
  end
end
