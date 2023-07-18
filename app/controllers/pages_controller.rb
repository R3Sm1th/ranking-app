class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :browse ]

  def home
  end

  def browse
  end
end
