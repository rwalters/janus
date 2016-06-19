module Generators
  class Mission
    def call(company_name: "Namely", mission_name: "Default Mission Name")
      GRPC.logger.info("-"*20)
      GRPC.logger.info(self.class.name)
      GRPC.logger.info("Company Name: #{company_name}")
      GRPC.logger.info("Mission Name: #{mission_name}")
      GRPC.logger.info("-"*20)

      name_length = SecureRandom.random_number(9) + 1
      id = SecureRandom.random_number(900) + 100

      ::Mission.new(
        id: id,
        company_name: "#{company_name}_#{id}",
        client_id: name_length**2,
        mission_name: mission_name*name_length
      )
    end
  end
end
