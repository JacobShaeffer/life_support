import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static values = { icon: String }

	activate(event) {
		event.preventDefault();
		var activated = document.querySelector(".active");
		if (activated) {
			activated.classList.remove("active");
		}
		this.element.classList.add("active");

		document.querySelector("#zone_icon").value = this.iconValue;
	}
}
