defmodule DonorQGenServer do
  use GenServer

  # register (save) the source for all handle_calls in the compiled file
  use Siariwyd, register: :handle_call

  def donor_q_genserver_state_put(pid, new_state) do
    GenServer.call(pid, {:state_put, new_state})
  end

  def handle_call({:state_put, new_state}, _fromref, state) do
    # return the old state but update to the new_state
    {:reply, state, new_state}
  end
end
