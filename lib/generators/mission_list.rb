module Generators
  class MissionList
    def call(list_length: (SecureRandom.random_number(9) + 1))
      GRPC.logger.info("-"*20)
      GRPC.logger.info(self.class.name)
      GRPC.logger.info("list_length: #{list_length}")

      mission_ary =
        list_length.times.map do
          Generators::Mission.new.call(mission_name: 'Gen Mission List')
        end

      GRPC.logger.info(mission_ary.inspect)
      GRPC.logger.info("-"*20)

      ::MissionList.new(
        missions: mission_ary
      )
    end
  end
end
