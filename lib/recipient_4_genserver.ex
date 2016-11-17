defmodule Recipient4GenServer do
  use GenServer
  # client API functions
  defdelegate donor_b_genserver_state_get(pid), to: DonorBGenServer
  defdelegate donor_c_genserver_state_put(pid, new_state), to: DonorCGenServer
  # handle_call functions
  defdelegate handle_call(pid, fromref, state), to: DonorBGenServer
  defdelegate handle_call(pid, fromref, state), to: DonorCGenServer
end
