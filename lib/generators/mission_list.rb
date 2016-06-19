module Generators
  # Create a *protobuf* _MissionList_ object for gRPC
  class MissionList
    def call(list_length: (SecureRandom.random_number(9) + 1))
      ::MissionList.new(
        missions: Array.new(list_length) do
          Generators::Mission.new.call(mission_name: 'Gen Mission List')
        end
      )
    end
  end
end
