require "spec_helper"
require "google/apis/drive_v3"

describe GoogleDriveHandler::Auth do

  let (:service) { subject.service }

  let (:title) { 'Test GoogleDrive Handler' }

  before do
    service.authorization = subject.authorize
    request_body = Google::Apis::SheetsV4::Spreadsheet.new
    spreadsheet = service.create_spreadsheet(request_body)
    spreadsheet.properties.uptate!(title: title)
    @id=spreadsheet.spreadsheet_id
  end

  it { expect(service.get_spreadsheet(@id).properties.title).to match title }

end


