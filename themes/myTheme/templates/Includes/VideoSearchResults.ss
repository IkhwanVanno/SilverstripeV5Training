<% if $Results %>
  <div class="container">
    <% loop $Results %>
      <a href="$VideoPage.Link" class="text-decoration-none text-dark">
        <div class="row g-3 align-items-center mb-3 p-2">
          <div class="col-md-5">
            <img src="$VideoThumbnail.Fill(350, 225).URL" alt="$Title" class="img-fluid rounded">
          </div>
          <div class="col-md-7">
            <h5 class="mb-1">$Title</h5>
          </div>
        </div>
      </a>
    <% end_loop %>
  </div>
<% else %>
  <div class="container text-center mt-4">
    <p class="text-muted">No Result found</p>
  </div>
<% end_if %>
