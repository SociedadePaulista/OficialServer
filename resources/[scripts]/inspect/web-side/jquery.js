window.addEventListener("message",function(event){
	switch(event["data"]["action"]){
		case "Open":
			Request();
			$(".inventory").css("display","flex");
		break;

		case "Close":
			$(".inventory").css("display","none");
			$(".ui-tooltip").hide();
		break;

		case "Request":
			Request();
		break;

		case "Update":
			$("#weightTextLeft").html(`${(event["data"]["invPeso"]).toFixed(2)} / ${(event["data"]["invMaxpeso"]).toFixed(2)}<i class="fa-solid fa-dumbbell"></i>`);
			$("#weightTextRight").html(`${(event["data"]["chestPeso"]).toFixed(2)} / ${(event["data"]["chestMaxpeso"]).toFixed(2)}<i class="fa-solid fa-dumbbell"></i>`);
			$("#weightBarLeft").html(`<div id="weightContent" style="width: ${event["data"]["invPeso"] / event["data"]["invMaxpeso"] * 100}%"></div>`);
			$("#weightBarRight").html(`<div id="weightContent" style="width: ${event["data"]["chestPeso"] / event["data"]["chestMaxpeso"] * 100}%"></div>`);
		break;
	}
});

$(document).ready(function(){
	document.onkeyup = data => {
		if (data["key"] === "Escape"){
			$.post("http://inspect/Close");
			$(".invRight").html("");
			$(".invLeft").html("");
		}
	};
});

const updateDrag = () => {
	$(".populated").draggable({
		helper: "clone",
		drag: function(event, ui) {
			let amount = $(".amount").val();
			if (event.shiftKey) {
				amount = parseInt(ui.helper.data("amount"));
			} else {
				if (amount == "" | parseInt(amount) <= 0) {
					amount = 1		
				} else {
					if (amount > parseInt(ui.helper.data("amount"))) {
						amount = parseInt(ui.helper.data("amount"))		
					}
				}
			}
		  	ui.helper.children(".top").children(".itemAmount").html(ParseFormat(amount) + "x");
			ui.helper.children(".top").children(".itemWeight").html((amount*parseFloat(ui.helper.data("peso"))).toFixed(2));
		}
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			if(ui.draggable.parent()[0] == undefined) return;

			const shiftPressed = event.shiftKey;
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = 0;
			let itemAmount = parseInt(ui.draggable.data('amount'));

			if (shiftPressed)
				amount = itemAmount;
			else if($(".amount").val() == "" | parseInt($(".amount").val()) <= 0)
				amount = 1;
			else
				amount = parseInt($(".amount").val());

			if(amount > itemAmount)
				amount = itemAmount;

			$('.populated, .empty').off("draggable droppable");

			let clone1 = ui.draggable.clone();
			let slot2 = $(this).data("slot"); 
			let added = Math.min(amount, parseInt(ui.draggable.data("stack")));		
			if (added <= parseInt(ui.draggable.data("amount"))) {

				ui.draggable.data("amount",parseInt(ui.draggable.data("amount")) - parseInt(added));
				ui.draggable.children(".top").children(".itemAmount").html(ParseFormat(ui.draggable.data("amount")) + "x");
				ui.draggable.children(".top").children(".itemWeight").html((parseInt(ui.draggable.data("amount"))*parseFloat(ui.draggable.data("peso"))).toFixed(2));
				
				clone1.data("amount",parseInt(added));
				$(this).replaceWith(clone1);
				$(clone1).data("slot",slot2);
				$(clone1).children(".top").children(".itemAmount").html(ParseFormat(clone1.data("amount")) + "x");
				$(clone1).children(".top").children(".itemWeight").html((parseInt(clone1.data("amount"))*parseFloat(ui.draggable.data("peso"))).toFixed(2));
				
				if (parseInt(ui.draggable.data("amount")) == 0){
					ui.draggable.replaceWith(`<div class="item empty" data-slot="${ui.draggable.data("slot")}"></div>`);
				}
			}

			updateDrag();

			if (origin === "invLeft" && tInv === "invLeft"){
				$.post("http://inventory/Update",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invRight" && tInv === "invLeft"){
				$.post("http://inspect/Take",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invLeft" && tInv === "invRight"){
				$.post("http://inspect/Store",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invRight" && tInv === "invRight"){
				$.post("http://inspect/Update",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			}

			$(".amount").val("");
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			if(ui.draggable.parent()[0] == undefined) return;

			const shiftPressed = event.shiftKey;
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined) return;
			const tInv = $(this).parent()[0].className;

			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			let amount = 0;
			let itemAmount = parseInt(ui.draggable.data('amount'));

			if (shiftPressed)
				amount = itemAmount;
			else if($(".amount").val() == "" | parseInt($(".amount").val()) <= 0)
				amount = 1;
			else
				amount = parseInt($(".amount").val());

			if(amount > itemAmount)
				amount = itemAmount;

			$('.populated, .empty, .use').off("draggable droppable");

			if(ui.draggable.data('item-key') == $(this).data('item-key')){
				let added = Math.min(amount, parseInt($(this).data("stack")) - parseInt($(this).data("amount")));
				if (added <= parseInt(ui.draggable.data("amount"))) {
					
					ui.draggable.data("amount",parseInt(ui.draggable.data("amount")) - parseInt(added));
					ui.draggable.children(".top").children(".itemAmount").html(ParseFormat(ui.draggable.data("amount")) + "x");
					ui.draggable.children(".top").children(".itemWeight").html((parseInt(ui.draggable.data("amount"))*parseFloat(ui.draggable.data("peso"))).toFixed(2));
					
					$(this).data("amount",parseInt($(this).data("amount")) + parseInt(added));
					$(this).children(".top").children(".itemAmount").html(ParseFormat($(this).data("amount")) + "x");
					$(this).children(".top").children(".itemWeight").html((parseInt($(this).data("amount"))*parseFloat(ui.draggable.data("peso"))).toFixed(2));

					if (parseInt(ui.draggable.data("amount")) == 0){
						ui.draggable.replaceWith(`<div class="item empty" data-slot="${ui.draggable.data("slot")}"></div>`);
					}
				}
			} else {
				if (origin === "invRight" && tInv === "invLeft") return;

				let clone1 = ui.draggable.clone();
				let clone2 = $(this).clone();

				let slot1 = ui.draggable.data("slot");
				let slot2 = $(this).data("slot");

				ui.draggable.replaceWith(clone2);
				$(this).replaceWith(clone1);

				$(clone1).data("slot",slot2);
				$(clone2).data("slot",slot1);
			}

			updateDrag();

			if (origin === "invLeft" && tInv === "invLeft") {
				$.post("http://inventory/Update",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invRight" && tInv === "invLeft"){
				$.post("http://inspect/Take",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invLeft" && tInv === "invRight"){
				$.post("http://inspect/Store",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			} else if (origin === "invRight" && tInv === "invRight"){
				$.post("http://inspect/Update",JSON.stringify({
					item: itemData.key,
					slot: itemData.slot,
					target: target,
					amount: parseInt(amount)
				}));
			}

			$(".amount").val("");
		}
	});

	$(".use").droppable({
		hoverClass: "hoverControl",
		drop: function(event,ui){
			if(ui.draggable.parent()[0] == undefined) return;
			const shiftPressed = event.shiftKey;
			const origin = ui.draggable.parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: ui.draggable.data("item-key"), slot: ui.draggable.data("slot") };
			if (itemData.key === undefined) return;
			let amount = $(".amount").val();
			if (shiftPressed) amount = ui.draggable.data("amount");
			$.post("http://inventory/Use",JSON.stringify({
				slot: itemData.slot,
				amount: parseInt(amount)
			}));
			$(".amount").val("");
		}
	});
	$(".populated").on("auxclick", e => {
		if (e["which"] === 3){
			const item = e["target"];
			const shiftPressed = event.shiftKey;
			const origin = $(item).parent()[0].className;
			if (origin === undefined || origin === "invRight") return;
			itemData = { key: $(item).data("item-key"), slot: $(item).data("slot") };
			if (itemData.key === undefined) return;
			let amount = $(".amount").val();
			if (shiftPressed) amount = $(item).data("amount");
			$.post("http://inventory/Use",JSON.stringify({
				slot: itemData.slot,
				amount: parseInt(amount)
			}));
		}
	});
	$(".populated").tooltip({
		create: function(event,ui){
			$(this).tooltip({
				content: $(this).attr("data-description"),
				position: { my: "center top + 10", at: "center bottom", collision: "flipfit" },
				show: { duration: 10 },
				hide: { duration: 10 }
			});
		}
	});
}

const colorPicker = (percent) => {
	var colorPercent = "#00f8b9";

	if (percent >= 100)
		colorPercent = "rgba(255,255,255,0)";

	if (percent >= 51 && percent <= 75)
		colorPercent = "#fcc458";

	if (percent >= 26 && percent <= 50)
		colorPercent = "#fc8a58";

	if (percent <= 25)
		colorPercent = "#fc5858";

	return colorPercent;
}

const Request = () => {
	$.post("http://inspect/Request",JSON.stringify({}),(data) => {
		$("#weightTextLeft").html(`${(data["invPeso"]).toFixed(2)} / ${(data["invMaxpeso"]).toFixed(2)}<i class="fa-solid fa-dumbbell"></i>`);
		$("#weightTextRight").html(`${(data["chestPeso"]).toFixed(2)} / ${(data["chestMaxpeso"]).toFixed(2)}<i class="fa-solid fa-dumbbell"></i>`);

		$("#weightBarLeft").html(`<div id="weightContent" style="width: ${data["invPeso"] / data["invMaxpeso"] * 100}%"></div>`);
		$("#weightBarRight").html(`<div id="weightContent" style="width: ${data["chestPeso"] / data["chestMaxpeso"] * 100}%"></div>`);

		$(".invLeft").html("");
		$(".invRight").html("");

		if (data["invMaxpeso"] > 100)
			data["invMaxpeso"] = 100;

		for (let x = 1; x <= data["invMaxpeso"]; x++){
			const slot = x.toString();

			if (data.myInventory[slot] !== undefined){
				const v = data.myInventory[slot];
				var maxDurability = 3600 * (v["days"] || 1);
				var newDurability = (maxDurability - (v["durability"] || 0)) / maxDurability;
				var actualPercent = newDurability * 100;

				if (v["charges"] !== undefined)
					actualPercent = v["charges"];

				if (actualPercent <= 1)
					actualPercent = 1;

				const item = `<div class="item populated" title="" style="background-image: url('nui://inventory/web-side/inventory/${v["index"]}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-stack="${v["stack"]}" data-item-key="${v["key"]}" data-slot="${slot}" data-peso="${v["peso"]}" data-description="${v["desc"]}">
					<div class="nameItem">${v.name}</div>
					<div class="top">
						<div class="itemAmount">${v.display || ParseFormat(v.amount)+"x"}</div>
						<div class="itemWeight">${(v.peso*v.amount).toFixed(2)}</div>
					</div>
					<div class="durability" style="width: ${actualPercent == 1 ? "100":actualPercent}%; background: ${actualPercent == 1 ? "#fc5858":colorPicker(actualPercent)};"></div>
				</div>`;

				$(".invLeft").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invLeft").append(item);
			}
		}

		for (let x = 1; x <= data["chestMaxpeso"]; x++){
			const slot = x.toString();

			if (data.myChest[slot] !== undefined){
				const v = data.myChest[slot];
				var maxDurability = 3600 * (v["days"] || 1);
				var newDurability = (maxDurability - (v["durability"] || 0)) / maxDurability;
				var actualPercent = newDurability * 100;

				if (v["charges"] !== undefined)
					actualPercent = v["charges"];

				if (actualPercent <= 1)
					actualPercent = 1;

				const item = `<div class="item populated" title="" style="background-image: url('nui://inventory/web-side/inventory/${v["index"]}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-stack="${v["stack"]}" data-item-key="${v["key"]}" data-slot="${slot}" data-peso="${v["peso"]}" data-description="${v["desc"]}">
					<div class="nameItem">${v.name}</div>
					<div class="top">
						<div class="itemAmount">${v.display || ParseFormat(v.amount)+"x"}</div>
						<div class="itemWeight">${(v.peso*v.amount).toFixed(2)}</div>
					</div>
					<div class="durability" style="width: ${actualPercent == 1 ? "100":actualPercent}%; background: ${actualPercent == 1 ? "#00f8b9":colorPicker(actualPercent)};"></div>
				</div>`;

				$(".invRight").append(item);
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				$(".invRight").append(item);
			}
		}

		updateDrag();
	});
}

const ParseFormat = n => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}