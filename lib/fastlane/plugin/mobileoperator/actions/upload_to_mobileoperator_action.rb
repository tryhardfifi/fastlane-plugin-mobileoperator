
require 'fastlane/action'
require 'net/http'
require 'uri'

module Fastlane
    module Actions
        class UploadToMobileoperatorAction < Action
            def self.run(params)
                file_path = params[:file_path]
                api_key = params[:api_key]
                
                if File.directory?(file_path)
                    zip_path = "#{file_path}.zip"
                    UI.message("📦 Zipping .app folder to #{zip_path}")
                    `zip -r -q #{zip_path.shellescape} #{file_path.shellescape}`
                    file_path = zip_path
                end
                
                UI.message("📤 Uploading #{file_path} to MobileOperator...")
                
                uri = URI.parse("https://mobileop-472949415807.us-central1.run.app/upload_app")
                request = Net::HTTP::Post.new(uri)
                form_data = [['file', File.open(file_path)], ['api_key', api_key]]
                request.set_form(form_data, 'multipart/form-data')
                
                response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
                    http.request(request)
                end
                
                UI.message("📨 Server response: #{response.code} - #{response.body}")
                
                if response.code.to_i == 200
                    UI.success("✅ Successfully uploaded #{file_path}")
                else
                    UI.user_error!("❌ Upload failed: #{response.code} - #{response.body}")
                end
            end
            
            def self.description
                "Uploads an IPA, APK, or .app folder to MobileOperator using your API key"
            end
            
            def self.available_options
                [
                FastlaneCore::ConfigItem.new(key: :file_path,
                                             description: "Path to IPA, APK, or .app file/folder",
                                             optional: false,
                                             type: String),
                                             FastlaneCore::ConfigItem.new(key: :api_key,
                                                                          description: "API key for your MobileOperator storage",
                                                                          optional: false,
                                                                          type: String)
                                                                          ]
            end
            
            def self.authors
                ["fifi"]
            end
            
            def self.is_supported?(platform)
                true
            end
        end
    end
end
