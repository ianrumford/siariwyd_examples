defmodule DonorPGenServer do
  use GenServer

  # register (save) the source for all handle_calls in the compiled file
  use Siariwyd, register: :handle_call

  def donor_p_genserver_state_get(pid) do
    GenServer.call(pid, :state_get)
  end

  def handle_call(:state_get, _fromref, state) do
    {:reply, state, state}
  end
end
