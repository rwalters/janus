require 'common'

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

  def mission_gen(company_name: "Namely", mission_name: "Test Mission")
    @mission_generator ||= Generators::Mission.new
    @mission_generator.call(company_name: company_name, mission_name: mission_name)
  end

  def mission_list_gen
    @mission_list_generator ||= Generators::MissionList.new
    @mission_list_generator.call
  end
end

p "Server staring ..."
port = ENV.fetch('PORT', '50051')
s = GRPC::RpcServer.new
s.add_http2_port("0.0.0.0:#{ port }", :this_port_is_insecure)
GRPC.logger.info("... running on #{port}")
s.handle(ServerImpl.new)
s.run_till_terminated
