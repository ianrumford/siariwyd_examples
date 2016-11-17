defmodule Recipient6GenServer do
  use GenServer

  # client API functions delegated as before
  defdelegate donor_p_genserver_state_get(pid), to: DonorPGenServer
  defdelegate donor_q_genserver_state_put(pid, new_state), to: DonorQGenServer

  # use Siariwyd to include the sources of the handle_call functions from the donor modules
  use Siariwyd, module: DonorPGenServer, include: :handle_call,
    filter: fn

    # match handle_call definitions
    %{name: :handle_call, args: args} = _implementation_definition ->
    # args is the list of quoted arguments to the implementation
    # e.g. handle_call(:state_get, fromref, state)
    case args |> List.first do
      :state_get -> false
      _ -> true
    end

    # not handle_call - discard
    _ -> false
  end
  use Siariwyd, module: DonorQGenServer, include: :handle_call
end
