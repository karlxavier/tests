class HomeController < ApplicationController

  def index
  end

  def sync
    Sync.now
  end
end