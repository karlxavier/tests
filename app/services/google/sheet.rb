class Google::Sheet
  class << self
    def candidates
      spreadsheet.worksheets.first.rows
    end

    private

    def session
      GoogleDrive::Session.from_service_account_key("config.json")
    end

    def spreadsheet
      session.spreadsheet_by_key("1xkofJa5iI3AQE4yWEoHqMTQ1QQ-VDsfUDDwV96QQDVM")
    end
    
  end
end