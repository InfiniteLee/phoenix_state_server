defmodule StateServer.Channels.Monitor do  
  def start_link(initial_state) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def get_state(room_id) do
    Agent.get(__MODULE__, fn state -> get_state(room_id, state) end)
  end

  defp get_state(room_id, state) do
    case state[room_id] do
      nil ->
        state
        |> Map.put(room_id, %{state: "new"})
        |> Map.get(room_id)
      data ->
        state[room_id]
    end
  end

  def update_state(room_id, delta) do
    Agent.update(__MODULE__, fn state -> update_state(state, room_id, delta) end)
  end

  defp update_state(state, room_id, delta) do
    state
    |> Map.put(room_id, delta)
  end

end  