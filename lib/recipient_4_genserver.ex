defmodule Recipient4GenServer do
  use GenServer
  # client API functions
  defdelegate donor_b_genserver_state_get(pid), to: DonorBGenServer
  defdelegate donor_c_genserver_state_put(pid, new_state), to: DonorCGenServer
  # handle_call functions
  defdelegate handle_call(pid, fromref, state), to: DonorBGenServer
  # this will be ignored but compiler will warn
  defdelegate handle_call(pid, fromref, state), to: DonorCGenServer
end
