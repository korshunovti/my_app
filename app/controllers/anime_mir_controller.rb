class AnimeMirController < ApplicationController
  def index
    @themes = Theme.all
    @values_qty = Value.count
  end
end