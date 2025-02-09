document.getElementById('postButton').addEventListener('click', function() {
  // Get post content from the textarea
  const postContent = document.getElementById('postContent').value;

  // Get the uploaded image (if any)
  const imageInput = document.getElementById('imageUpload');
  const file = imageInput.files[0];
  const feed = document.getElementById('feed');
  
  // Only proceed if there's content to post
  if (postContent || file) {
    const postElement = document.createElement('div');
    postElement.classList.add('card', 'mb-3');
    postElement.style.width = '100%';

    // Add content text to post
    let postHTML = `
      <div class="card-body">
        <h5 class="card-title">Username</h5>
        <p class="card-text">${postContent}</p>
      </div>
    `;

    // If there is an image, read it as a Data URL and append it
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        // Add the image to postHTML here
        postHTML += `<img src="${e.target.result}" class="post-image card-img-bottom" alt="Post Image">`;
        postElement.innerHTML = postHTML;
        feed.prepend(postElement);
      };
      reader.readAsDataURL(file);
    } else {
      postElement.innerHTML = postHTML;
      feed.prepend(postElement);
    }
      
// Add click event listener to feed for image modal trigger
    document.getElementById('feed').addEventListener('click', function(event) {
        if (event.target.classList.contains('post-image')) {
         const imageUrl = event.target.src;
         const modalImage = document.getElementById('modalImage');
         modalImage.src = imageUrl;

    // Show the modal
    const imageModal = new bootstrap.Modal(document.getElementById('imageModal'));
    imageModal.show();
  }
});

    // Clear the text area and image input after posting
    document.getElementById('postContent').value = '';
    imageInput.value = '';
  } else {
    alert('Please enter some text or upload an image before posting.');
  }
});

// Trigger file input when the button is clicked
document.getElementById('uploadButton').addEventListener('click', function() {
  document.getElementById('imageUpload').click();
});

// Display image preview
document.getElementById('imageUpload').addEventListener('change', function(event) {
  const file = event.target.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
      // Remove any previous preview
      const existingPreview = document.querySelector('.img-thumbnail');
      if (existingPreview) {
        existingPreview.remove();
      }

      // Display the new image preview
      const imgPreview = document.createElement('img');
      imgPreview.src = e.target.result;
      imgPreview.classList.add('img-thumbnail', 'mt-3');
      document.querySelector('.mb-3').appendChild(imgPreview);
    };
    reader.readAsDataURL(file);
  }
});
