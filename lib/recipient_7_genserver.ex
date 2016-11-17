defmodule Recipient7GenServer do
  use GenServer

  # client API functions delegated as before
  defdelegate donor_p_genserver_state_get(pid), to: DonorPGenServer
  defdelegate donor_q_genserver_state_put(pid, new_state), to: DonorQGenServer

  # use Siariwyd to include the sources of the handle_call functions from the donor modules
  use Siariwyd, module: DonorPGenServer, include: :handle_call,
    mapper: fn

    # select handle_call definition
    %{name: :handle_call, args: args, ast: ast} = implementation_definition ->
    # args is the list of quoted arguments to the implementation
    # e.g. handle_call(:state_get, fromref, state)

    [arg | rest_args] = args

    case arg do
      :state_get ->

        # change the args to respond to :hello_world and reconstruct the implementation
        implementation_definition
        |> Map.put(:args, [:hello_world | rest_args])
        # reconstruct the complete implementation using the convenience function
        |> Siariwyd.reconstruct_function

      # nothing to do
      x -> x
    end

    # passthru
    x -> x
  end
  use Siariwyd, module: DonorQGenServer, include: :handle_call

  # include a client API function for :hello_world
  def recipient_7_hello_world(pid) do
    GenServer.call(pid, :hello_world)
  end
end
