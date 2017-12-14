require "spec_helper"
require "google/apis/drive_v3"
require 'google/apis/sheets_v4'

describe GoogleDriveHandler::Auth do

  let (:service) {  Google::Apis::SheetsV4::SheetsService.new }

  let (:drive) { Google::Apis::DriveV3::DriveService.new }

  let (:title) { 'Test Google Drive Handler' }

  before do

    service.authorization = subject.authorize
    request_body = Google::Apis::SheetsV4::Spreadsheet.new
    spreadsheet = service.create_spreadsheet(request_body)
    spreadsheet.properties.update!(title: title)

    @id=spreadsheet.spreadsheet_id
  end

  after do
    drive.authorization = subject.authorize
    drive.delete_file @id
  end

  it { expect(service.get_spreadsheet(@id).properties.title).to match title }

end


