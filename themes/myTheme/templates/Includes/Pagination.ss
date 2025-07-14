<% if $PaginatedList.MoreThanOnePage %>
    <nav aria-label="Page navigation" class="mt-4">
        <div class="pagination justify-content-center">
            <% if $PaginatedList.NotFirstPage %>
                <li class="page-item">
                    <a class="page-link" href="$PaginatedList.PrevLink" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            <% end_if %>

            <% loop $PaginatedList.Pages %>
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

            <% if $PaginatedList.NotLastPage %>
                <li class="page-item">
                    <a class="page-link" href="$PaginatedList.NextLink" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <% end_if %>
      </div>
    </nav>
<% end_if %>
