require 'common'
require 'securerandom'

# Configure its logging for fine-grained log control during test runs
module GRPC
  extend Logging.globally
end
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

# ServerImpl provides an implementation of the Janus service.
class ServerImpl < Janus::Janus::Service
  # Create a new address
  def create_mission(create_mission_req, _call)
    p create_mission_req.mission

    CreateMissionResp.new(
      mission: gen_mission
    )
  end

  def get_mission_list(get_mission_list_req, _call)
    p get_mission_list_req

    GetMissionListResp.new(
      mission_list: MissionList.new(
        gen_mission_list
      )
    )
  end

  def get_mission(get_mission_req, _call)
    p get_mission_req

    GetMissionResp.new(
      mission: gen_mission(mission_name: "Mission response")
    )
  end


  private

  def gen_mission(company_name: "Namely", mission_name: "Test Mission")
    name_length = SecureRandom.random_number(9) + 1
    id = SecureRandom.random_number(900) + 100

    Mission.new(
      id: id,
      company_name: "#{company_name}_#{id}",
      client_id: name_length**2,
      mission_name: mission_name*name_length
    )
  end

  def gen_mission_list
    list_length = SecureRandom.random_number(9) + 1

    list_length.times.map do
      gen_mission(mission_name: 'Gen Mission List')
    end
  end
end

p "Server staring ..."
port = ENV.fetch('PORT', '50051')
s = GRPC::RpcServer.new
s.add_http2_port("0.0.0.0:#{ port }", :this_port_is_insecure)
GRPC.logger.info("... running on #{port}")
s.handle(ServerImpl.new)
s.run_till_terminated
