// when and image is clicked, a modal is popped up and image zooms

function modalImageZoom (imgId, modalId, modalImageId) {
	// Get the modal
	var modal = document.getElementById(modalId);

	// Get the image and insert it inside the modal - use its "alt" text as a caption
	var img = document.getElementById(imgId);
	var modalImg = document.getElementById(modalImageId);
	//var captionText = document.getElementById("caption");
	
	//popup the modal and set the image source
	modal.style.display = "block";
	modalImg.src = img.src;
	//captionText.innerHTML = this.alt;
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() { 
	  modal.style.display = "none";
	}
}