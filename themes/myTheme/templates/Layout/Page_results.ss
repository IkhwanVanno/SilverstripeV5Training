<div id="Content" class="container my-5">
  <h1 class="mb-4">$Title</h1>

  <% if $Query %>
    <p class="text-muted">You searched for <strong>&quot;{$Query}&quot;</strong></p>
  <% end_if %>

  <% if $Results %>
    <div class="list-group mb-4">
      <% loop $Results %>
        <div class="list-group-item">
          <h5 class="mb-1">
            <a href="$Link" class="text-decoration-none">
              <% if $MenuTitle %>
                $MenuTitle
              <% else %>
                $Title
              <% end_if %>
            </a>
          </h5>

          <% if $Content %>
            <p class="mb-1 text-secondary">$Content.LimitWordCountXML</p>
          <% end_if %>

          <a class="btn btn-sm btn-outline-primary mt-2" href="$Link" title="Read more about &quot;{$Title}&quot;">
            Read more...
          </a>
        </div>
      <% end_loop %>
    </div>

    <!-- Pagination -->
    <nav aria-label="Search results pages">
      <ul class="pagination justify-content-center">
        <% if $Results.NotFirstPage %>
          <li class="page-item">
            <a class="page-link" href="$Results.PrevLink" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
        <% end_if %>

        <% loop $Results.Pages %>
          <% if $CurrentBool %>
            <li class="page-item active" aria-current="page">
              <span class="page-link">$PageNum</span>
            </li>
          <% else %>
            <li class="page-item">
              <a class="page-link" href="$Link">$PageNum</a>
            </li>
          <% end_if %>
        <% end_loop %>

        <% if $Results.NotLastPage %>
          <li class="page-item">
            <a class="page-link" href="$Results.NextLink" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        <% end_if %>
      </ul>
    </nav>
  <% else %>
    <div class="alert alert-warning mt-4" role="alert">
      Sorry, your search query did not return any results.
    </div>
  <% end_if %>
</div>
