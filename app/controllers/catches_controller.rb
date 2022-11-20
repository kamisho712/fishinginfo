class CatchesController < ApplicationController
  def index
    @catches = Catch.all
  end
end
