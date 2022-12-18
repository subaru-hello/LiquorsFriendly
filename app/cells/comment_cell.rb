# frozen_string_literal: true

class CommentCell < Cell::ViewModel
  property :body
  property :title
  property :status
  property :liquor
  def show
    render
  end

  private

  def archived?
    status == 'archived'
  end

  def destroy_link
    link_to 'Destroy Comment', [model.liquor, model], data: {
      turbo_method: :delete,
      turbo_confirm: 'Are you sure?'
    }
  end
end
