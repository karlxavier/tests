class Talkpush::Api
  include HTTParty
  BASE_URI = 'http://my.talkpush.com/api/talkpush_services'.freeze

  def initialize(candidate: nil)
    @candidate = candidate
  end

  def candidate_present?
    get['total'] >= 1
  end

  def create_candidate!
    post
  end

  private 

  def get
    response = HTTParty.get(
      "#{BASE_URI}/campaign_invitations",
      query: {
        api_key: ENV["talkpush_api_key"],
        api_secret: ENV["talkpush_api_secret"],
        'filter[query]': @candidate[3] #candidate's email
      }
    )   

    return false unless response.success?
    response.parsed_response
  end

  def post
    response = HTTParty.post(
      "#{BASE_URI}/campaign_invitations/1/campaign_invitations",
      body: {
        api_key: ENV["talkpush_api_key"],
        api_secret: ENV["talkpush_api_secret"],
        campaign_invitation: {
          first_name: @candidate[1],
          last_name: @candidate[2],
          email: @candidate[3],
          user_phone_number: @candidate[4]
        }
      }
    )

    puts "Candidate #{fullname} successfully created" if response.success?
    response.success?
  end

  def fullname
    [@candidate[1], @candidate[2]].join(' ')
  end

end