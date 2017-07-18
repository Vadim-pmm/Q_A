include ActionView::Helpers::SanitizeHelper

class GeneratePdf < Prawn::Document
  require 'prawn/table'

  def initialize
    super(top_margin: 70)

    font_families.update('MyFont' => {
        normal: Rails.root.join('app/assets/fonts/OpenSans-Regular.ttf'),
        bold: Rails.root.join('app/assets/fonts/OpenSans-Bold.ttf')
    })
    font 'MyFont', size: 8
  end

  def create_content(str_)
    move_down(20)
    text 'Your questions: ' + str_, size: 12, style: :bold
    move_down(10)
    text 'Session started: ' + str_, size: 10, style: :bold
    move_down(20)

    arr = Answer.where(session_id: DateTime.parse(str_)).pluck(:question_id)
    list = Question.where(id: arr)

    data_ = [%w(Question Answer Category)] + (list.map { |item| [strip_tags(item.question), strip_tags(item.answer), strip_tags(item.category)] })
    table data_ do
      self.column_widths = [150, 300, 60]
      columns(0..1).align = :right
      columns(2).align    = :center
      row(0).font_style   = :bold
      row(0).align = :center
      style row(0), font_size: 10

      self.row_colors = ['FFFFFF', 'DDDDDD']
      self.header = true
    end
  end
end