require "prawn/measurement_extensions"

prawn_document do |pdf|

  [:mm, :cm, :dm, :m, :in, :yd, :ft].each do |measurement|
   #pdf.text "1 #{measurement} in PDF Points: #{1.send(measurement)}", :color => "dddddd", :size => 10
   #pdf.move_down 5.mm
  end

  k = pdf.bounds.top                    # margin top
  columns = (567 / 5.mm ).to_i          # number of columns
  rows = ((k - 5.mm ) /  5.mm).to_i     # number of rows

  pdf.stroke_color 'eeeeee'
  (0..rows).each do |i|
    if i < columns
      pdf.line(i * 5.mm, k - rows * 5.mm,i * 5.mm,k)
    end
    pdf.stroke_horizontal_rule
    pdf.move_down 5.mm
  end



  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 15], :width  => pdf.bounds.width do
      pdf.stroke_horizontal_rule
      pdf.move_down(5)
      pdf.text 'PaperTool 2017 by Roberto Alicata', :color => "cccccc", :size => 8
  end


end
