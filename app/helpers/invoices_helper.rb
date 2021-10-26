module InvoicesHelper
	def priority_tag_for_invoice(invoice)
  printonrails_status_tag invoice_priority(invoice), color_for_invoice_status(invoice.priority)
  end

  def color_for_invoice_status(invoice_status)
    case invoice_status
      when 'completed'
        :green
      when 'shipped'
      	:green
      when 'pending'
        :yellow
      when 'shipping'
        :orange
      when 'canceled'
        :red
    end
  end
end
