defmodule DonorBGenServer do
  use GenServer
  def donor_b_genserver_state_get(pid) do
    GenServer.call(pid, :state_get)
  end
  def handle_call(:state_get, _fromref, state) do
    {:reply, state, state}
  end
end
