require "prawn/measurement_extensions"

prawn_document do |pdf|

  [:mm, :cm, :dm, :m, :in, :yd, :ft].each do |measurement|
   #pdf.text "1 #{measurement} in PDF Points: #{1.send(measurement)}", :color => "dddddd", :size => 10
   #pdf.move_down 5.mm
  end

  sq = @square_size
  k = pdf.bounds.top                     # margin top
  columns = (570 / sq.mm ).floor         # number of columns
  rows = (k / sq.mm).floor               # number of rows

  pdf.stroke_color 'eeeeee'
  (1..rows).each do |i|
    if i <= columns
      if @type == 'squares'
        pdf.line((i-1) * sq.mm, sq.mm, (i-1) * sq.mm, sq.mm * rows)
      end
    end

    if @type != "dots"
      pdf.line(0, i * sq.mm, (columns - 1 ) * sq.mm, i * sq.mm)
    else
      (1..columns).each do |j|
        pdf.stroke_color '000000'
        pdf.circle( [( j-1) * sq.mm, (i  + 1) * sq.mm], 0.4)
      end
    end

  end

  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 16], :width  => pdf.bounds.width do
      pdf.move_down(4)
      pdf.stroke_color 'eeeeee'
      pdf.stroke_horizontal_rule
      pdf.move_down(4)
      pdf.text "PaperTool 2017 by Roberto Alicata - #{@name}", :color => "cccccc", :size => 8
  end

end
