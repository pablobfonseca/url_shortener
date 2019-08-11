namespace :urls do
  desc "Import URLS"
  task import: :environment do
    
    %w(https://facebook.com https://google.com https://github.com https://trello.com https://twitter.com).each do |original_url|
        UrlCreateService.new(original_url: original_url).perform
    end

    puts "Urls has been imported successfully"
  end
end
