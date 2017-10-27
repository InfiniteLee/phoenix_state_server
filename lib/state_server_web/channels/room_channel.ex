defmodule StateServerWeb.RoomChannel do
  use StateServerWeb, :channel

  alias StateServer.Channels.Monitor

  def join("room:" <> room_id, _payload, socket) do
    send self(), {:after_join, room_id}
    {:ok, assign(socket, :room_id, room_id)}
  end

  def handle_in("state:update", state, socket) do  
    Monitor.update_state(socket.assigns.room_id, state)
    new_state = Monitor.get_state(socket.assigns.room_id)
    broadcast! socket, "state:updated", state
    {:noreply, socket}
  end 

  def handle_info({:after_join, room_id}, socket) do
    state = Monitor.get_state(room_id)
    broadcast! socket, "user:joined", state
    {:noreply, socket}
  end
end
