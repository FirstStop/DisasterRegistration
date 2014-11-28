require 'cups'
require 'cups/printer/printer'
require 'cups/print_job/transient'

module Services
  class Printers
    def self.print_token(file, media, printer_name=nil)
        # DC03 => 29 mm x 90 mm
        # DC04 => 38 mm x 90 mm
        options = { 'media' => media , 'orientation-requested' => '4'}
    
        if printer_name == nil
            printer_name = Cups.default_printer
        end
        print_job = Cups::PrintJob.new(file.path, printer_name, options)
        print_job.print
        Rails.logger.info "Print job  #{print_job.job_id} #{print_job.title} #{print_job.filename} - #{print_job.state}"
    end

    def self.printer_is_accepting_jobs(printer_name)
        begin
            printer = Cups::Printer.new(printer_name)
            printer.printer_is_accepting_jobs == "true"
        rescue
            false
        end
    end
  end
end
