# frozen_string_literal: true

class LiquorsCell < Cell::ViewModel
  property :status
  property :name
  property :liquor
  property :price
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

  def liquor_status
    case status
    when 'sold_out'
      '売り切れ'
    when 'on_sale'
      '販売中'
    when 'booked'
      '順番待ち'
    else
      '入荷待ち'
    end
  end
end
