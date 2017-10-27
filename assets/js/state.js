import {Socket} from "phoenix"

let State = {
	init() {
		let socket = new Socket("/socket", {params:{}})
		socket.connect()

		let state = {}

		let room = socket.channel("room:test")

		room.on("state:updated", new_state => {
			state = new_state
			console.log("state:updated")
			console.log(state)
		})

		room.on("user:joined", new_state => {
			state = new_state
			console.log("user:joined")
			console.log(state)
		})

		room.join()

		window.updateState = function (state) {
			room.push("state:update", {state: state})
		}
	}
}

export default State