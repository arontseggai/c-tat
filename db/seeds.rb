require 'httparty'

class LoadQuotes

    def initialize(url, provider)
        @url = url
        @provider = provider
    end

    def complete_load
        quotes = self.call_api
        self.save_quotes(quotes)
    end


    def call_api
        HTTParty.get @url
    end

    def save_quotes(quotes)

        quotes = JSON.parse(quotes.body)

        count = 0
        quotes.each do |quote|

        case @provider
            when 'stormconsultancy' 
                record = Quote.new
                record.author = quote['author']
                record.content = quote['quote']
                record.provider = @provider
                record.provider_id = quote['id']
                record.perma_link = quote['permalink']
                record.save
            end

            puts "Record from #{record.provider}, with id: #{record.id} has been saved to the database"
            count += 1
        end

        puts "#{count} records have been saved"
    end
end

stormconsultancy = LoadQuotes.new("http://quotes.stormconsultancy.co.uk/quotes.json", "stormconsultancy")

stormconsultancy.complete_load