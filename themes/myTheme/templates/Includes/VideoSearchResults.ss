<% if $Results %>
      <% loop $Results %>
            <a class="d-flex my-2" href="$VideoPage.Link">
                  <div class="col-5">
                        $VideoThumbnail.Fill(350, 225)
                  </div>
                  <div class="col-7">
                        <h2>$Title</h2>
                  </div>
            </a>
      <% end_loop %>
<% else %>
<p>No Result found</p>
<% end_if %>