require "spec_helper"
require "google/apis/drive_v3"
require 'google/apis/sheets_v4'

describe GoogleDriveHandler::Auth do

  let (:drive) { Google::Apis::DriveV3::DriveService.new }

  it { expect(subject.scope.map(&:to_s).join(' ')).to match ENV['SCOPE'] }

  describe "#authorize" do

    # the env var SCOPE=1 4

    let (:service) {  Google::Apis::SheetsV4::SheetsService.new }

    let (:values) { [["A1","B1"],["A2","B2"]] }

    let (:range) { "A1:B2" }

    before do

      service.authorization = subject.authorize
      request_body = Google::Apis::SheetsV4::Spreadsheet.new
      spreadsheet = service.create_spreadsheet(request_body)
      @id=spreadsheet.spreadsheet_id
      value_range=Google::Apis::SheetsV4::ValueRange.new major_dimension: 'ROWS', range: range , values: values
      service.append_spreadsheet_value( @id, range, value_range, value_input_option: 'USER_ENTERED')

    end

    after do
      drive.authorization = subject.authorize
      drive.delete_file @id
    end

    it { expect(service.get_spreadsheet_values(@id,range).values).to match values }

  end

  describe "Drive folders" do

    let (:root_folder_id) { ENV['TEST_DRIVE_FOLDER_ID'] }

    let (:name) { 'Test Drive Folder' }

    before do
      drive.authorization = subject.authorize
      file_metadata = {
        name: name,
        mime_type: 'application/vnd.google-apps.folder',
        parents: [root_folder_id]
      }
      file = drive.create_file(file_metadata, fields: 'id')
      @id=file.id
    end

    after { drive.delete_file @id }

    it { expect(drive.get_file(@id).name).to match name }

  end

end


