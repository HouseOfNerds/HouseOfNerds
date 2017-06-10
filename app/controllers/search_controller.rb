# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @query = params[:q]&.strip
    return if @query.blank?
    db_query = "%#{@query}%"
    @customers = Customer
        .where('email ILIKE :query OR name ILIKE :query OR phone ILIKE :query',
            query: db_query)
        .order(updated_at: :desc)
        .distinct.to_a
  end
end
