class LoadingPdf < Prawn::Document

  def initialize(loading)
    super()

    @loading = loading
    text "Loading \##{@loading.reference} Info will be here"
    customer_info
    invoice_line
  end

  def customer_info
    bounding_box([300,700], :width => 200, :height => 100) do
      text @loading.company.title
      text @loading.company.address

      transparent(0.2) { stroke_bounds }
    end
  end

  def invoice_line
    bounding_box([10,500], :width => 500, :height => 200) do
      table line_items do
        self.column_widths = [300, 150, 50]
        self.columns(1).align = :right
        self.row_colors = ["EEEEEE", "FFFFFF"]
        self.header = false
      end
      transparent(0.5) { stroke_bounds }
    end
  end

  def line_items
    #[["Services", "Price", "Currency"]] + 
    [["Navlun", @loading.freight_price, @loading.freight_curr], 
     ["THC", 200, "TL"]]
  end
end
