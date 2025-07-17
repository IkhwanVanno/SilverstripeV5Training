<div class="container my-5">
  <% loop $VideoObjects.Limit(1) %>
    <h1 class="mb-4">$Title</h1>

    <div class="mb-4">
      <video class="w-100 rounded shadow-sm" style="max-width: 640px;" controls>
        <source src="$VideoSource.URL" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </div>

    <% if $Description %>
      <p class="lead">$Description</p>
    <% end_if %>

    <% if $VideoCategories %>
      <div class="mt-3">
        <h6>Categories:</h6>
        <ul class="list-inline">
          <% loop $VideoCategories %>
            <li class="list-inline-item badge bg-secondary me-1">$Title</li>
          <% end_loop %>
        </ul>
      </div>
    <% end_if %>
  <% end_loop %>
</div>

<div class="container mb-5">
  <h5 class="mb-3">Comments:</h5>

  <% if $VideoComments.exists %>
    <div class="list-group mb-3">
      <% loop $VideoComments %>
        <div class="list-group-item">
          <p class="mb-1"><strong>$Name:</strong></p>
          <p class="mb-0">$Comment</p>
        </div>
      <% end_loop %>
    </div>
  <% else %>
    <div class="alert alert-info" role="alert">
      Tidak ada komentar.
    </div>
  <% end_if %>
</div>

<div class="container mb-5">
  <div class="card shadow-sm">
    <div class="card-body">
      <h5 class="card-title mb-3">Leave a Comment</h5>
      $CommentForm
    </div>
  </div>
</div>
