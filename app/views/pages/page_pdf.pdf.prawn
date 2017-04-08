require "prawn/measurement_extensions"

prawn_document do |pdf|

  [:mm, :cm, :dm, :m, :in, :yd, :ft].each do |measurement|
   #pdf.text "1 #{measurement} in PDF Points: #{1.send(measurement)}", :color => "dddddd", :size => 10
   #pdf.move_down 5.mm
  end

  sq = @square_size
  k = pdf.bounds.top - 45                    # margin top
  columns = ((pdf.bounds.width) / sq.mm ).floor + 1        # number of columns
  rows = (k / sq.mm).floor               # number of rows
  pdf.text  @header_h1, :color => "999999", :size => 12
  pdf.move_down(1)
  pdf.text  @header_body, :color => "aaaaaa", :size => 8

  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 20], :width  => pdf.bounds.width do
    pdf.stroke_color 'eeeeee'
    (1..rows).each do |i|
      if i <= columns
        if @type == 'squares'
          pdf.line((i-1) * sq.mm, sq.mm, (i-1) * sq.mm, sq.mm * rows)
        end
      end

      if @type != "dots"
        pdf.line(0, i  * sq.mm, (columns - 1 ) * sq.mm, i * sq.mm)
      else
        (1..columns).each do |j|
          pdf.stroke_color '555555'
          pdf.circle( [( j-1) * sq.mm, (i) * sq.mm], 0.4)
        end
      end

    end
  end



  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 20], :width  => pdf.bounds.width do
      pdf.move_down(4)
      #pdf.stroke_color 'eeeeee'
      #pdf.stroke_horizontal_rule
      #pdf.move_down(4)
      pdf.text "PaperTool 2017 by Roberto Alicata - #{@name}", :color => "aaaaaa", :size => 8
      pdf.text "papertool.herokuapp.com", :color => "aaaaaa", :size => 6

  end

pdf.stroke
end
