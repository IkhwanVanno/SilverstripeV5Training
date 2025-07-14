<div class="container">
      <% loop $VideoObjects.Limit(1) %>
      <h1> $Title</h1>
      <video height="225" width="400" controls>
            <source src="$VideoSource.URL" type="video/mp4">
      </video>
      <% if $Description %>
            <p> $Description</p>
      <% end_if %>
      <ul>
            <% loop $VideoCategories %>
            <li>$Title</li>
            <% end_loop %>
      </ul>
      <% end_loop %>
</div>
<div class="container">
      <h5>Comments :</h5>
    <% if $VideoComments.exists %>
        <% loop $VideoComments %>
            <p><strong>$Name:</strong> $Comment</p>
        <% end_loop %>
    <% else %>
        <p>Tidak ada komentar.</p>
    <% end_if %>
</div>
<div class="container">
      <div class="row">
            <div class="">
                  $CommentForm
            </div>
      </div>
</div>