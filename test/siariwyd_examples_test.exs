defmodule SiariwydExamplesTest do
  use ExUnit.Case
  test "test_donor_a_recipient_1_donor_a_fun_j" do
    assert :donor_a_fun_j = Recipient1.recipient_a_fun_p
  end
  test "test_donor_a_recipient_2_donor_a_fun_j" do
    assert :donor_a_fun_j = Recipient2.recipient_2_fun_p
  end
  test "test_donor_a_recipient_3_donor_a_fun_j" do
    assert :donor_a_fun_j = Recipient3.donor_a_fun_j
  end
  test "test_donors_bc_genserver_recipient_4_state_get" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient4GenServer, state)
    assert ^state = Recipient4GenServer.donor_b_genserver_state_get(pid)
  end
  test "test_donors_bc_genserver_recipient_4_state_put" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient4GenServer, state)
    assert_raise FunctionClauseError, fn ->
      Recipient4GenServer.donor_c_genserver_state_put(pid, :new_state)
    end
  end
  test "test_donors_pq_genserver_recipient_5_state_get" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient5GenServer, state)
    assert ^state = Recipient5GenServer.donor_p_genserver_state_get(pid)
  end
  test "test_donors_pq_genserver_recipient_5_state_put" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient5GenServer, state)
    ^state = Recipient5GenServer.donor_q_genserver_state_put(pid, :new_state)
  end
  test "test_donors_pq_genserver_recipient_6_filter_state_get" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient6GenServer, state)
    assert_raise FunctionClauseError, fn ->
      Recipient6GenServer.donor_p_genserver_state_get(pid)
    end
  end
  test "test_donors_pq_genserver_recipient_7_mapper_state_get" do
    state = :initial_state
    {:ok, pid} = GenServer.start_link(Recipient7GenServer, state)

    # hello_world now gets the state
    assert ^state = Recipient7GenServer.recipient_7_hello_world(pid)

    # state_get no longer works as the handle_call has been changed (mapped)
    assert_raise FunctionClauseError, fn ->
      Recipient7GenServer.donor_p_genserver_state_get(pid)
    end
  end
end
