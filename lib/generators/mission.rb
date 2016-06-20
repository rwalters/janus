module Generators
  # A class to hold code to randomly generate an instance of Mission
  class Mission
    # A generator to create a random Mission
    #
    # @param company_name [String] Defaults to 'Namely'
    # @param mission_name [String] Defaults to 'Test Mission'
    # @return [Mission]
    #   A randomly generated instance of Mission
    def call(company_name: 'Namely', mission_name: 'Default Mission Name')
      id = SecureRandom.random_number(900) + 100

      ::Mission.new(
        id: id,
        company_name: "#{company_name}_#{id}",
        client_id: (id % 17),
        mission_name: mission_name * (id % 9)
      )
    end
  end
end
