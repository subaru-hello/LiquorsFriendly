# frozen_string_literal: true

class LiquorsCell < Cell::ViewModel
  property :status
  property :name
  property :liquor
  def show
    render
  end

  private

  def liquor_link
    link_to model.name.to_s, model
  end

  def sold_out?
    status == 'sold_out'
  end
end
