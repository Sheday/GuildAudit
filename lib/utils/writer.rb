module Audit
  module Writer

    def self.write(team, result)
      file = STORAGE.bucket(BUCKET).object("#{team.key_code}.csv")
      data = CSV.generate do |csv|
        csv << HEADER
        result.each do |uri, character|
          csv << character.output
        end
      end
      file.put(body: data)
    end
  end
end