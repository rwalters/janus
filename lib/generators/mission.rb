module Generators
  # Create a *protobuf* _Mission_ object for gRPC
  class Mission
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
