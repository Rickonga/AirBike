class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  layout "landing"
  def home; end
end
