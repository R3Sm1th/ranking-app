class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :browse, :howitworks ]

  def home
  end

  def browse
  end

  def howitworks
  end
end
