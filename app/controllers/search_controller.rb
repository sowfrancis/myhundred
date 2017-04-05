class SearchController < ApplicationController
  include SimpleSearch

  def search
    searching
  end
end
