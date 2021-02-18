class Sync
  class << self
    def now
      begin
        Google::Sheet.candidates.each do |candidate|
          next if candidate.length < 5

          talkpush = Talkpush::Api.new(candidate: candidate)
          talkpush.create_candidate! unless talkpush.candidate_present?
        end
      rescue => e
        puts "ERROR:: #{e}"
      end
    end
  end
end