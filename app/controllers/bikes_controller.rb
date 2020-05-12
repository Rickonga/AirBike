class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @bikes = policy_scope(Bike)
  end
end
