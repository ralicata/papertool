require "prawn/measurement_extensions"

prawn_document do |pdf|

  [:mm, :cm, :dm, :m, :in, :yd, :ft].each do |measurement|
   #pdf.text "1 #{measurement} in PDF Points: #{1.send(measurement)}", :color => "dddddd", :size => 10
   #pdf.move_down 5.mm
  end

  k = pdf.bounds.top
  a = 40
  b = ( (k - 5.mm ) /  5.mm).to_i

  pdf.stroke_color 'eeeeee'
  (0..b).each do |i|
    if i < a
      pdf.line(i * 5.mm, k - b * 5.mm,i * 5.mm,k)
    end
    pdf.stroke_horizontal_rule
    pdf.move_down 5.mm
  end



  pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 15], :width  => pdf.bounds.width do
      pdf.stroke_horizontal_rule
      pdf.move_down(5)
      pdf.text 'PaperTool by Roberto Alicata', :color => "dddddd", :size => 8
  end


end
