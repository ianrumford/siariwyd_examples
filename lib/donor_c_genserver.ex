defmodule DonorCGenServer do
  use GenServer
  def donor_c_genserver_state_put(pid, new_state) do
    GenServer.call(pid, {:state_put, new_state})
  end
  def handle_call({:state_put, new_state}, _fromref, state) do
    # return the old state but update to the new_state
    {:reply, state, new_state}
  end
end
