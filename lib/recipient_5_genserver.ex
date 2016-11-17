defmodule Recipient5GenServer do
  use GenServer

  # client API functions delegated as before
  defdelegate donor_p_genserver_state_get(pid), to: DonorPGenServer
  defdelegate donor_q_genserver_state_put(pid, new_state), to: DonorQGenServer

  # use Siariwyd to include the sources of the handle_call functions from the donor modules
  use Siariwyd, module: DonorPGenServer, include: :handle_call
  use Siariwyd, module: DonorQGenServer, include: :handle_call
end
