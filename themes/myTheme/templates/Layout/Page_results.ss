<div id="Content" class="searchResults">
    <h1>$Title</h1>

    <% if $Query %>
        <p class="searchQuery">You searched for &quot;{$Query}&quot;</p>
    <% end_if %>

    <% if $Results %>
    <ul id="SearchResults">
        <% loop $Results %>
        <li>
            <h4>
                <a href="$Link">
                    <% if $MenuTitle %>
                    $MenuTitle
                    <% else %>
                    $Title
                    <% end_if %>
                </a>
            </h4>
            <% if $Content %>
                <p>$Content.LimitWordCountXML</p>
            <% end_if %>
            <a class="readMoreLink" href="$Link" title="Read more about &quot;{$Title}&quot;">Read more about &quot;{$Title}&quot;...</a>
        </li>
        <% end_loop %>
    </ul>
    <% else %>
    <p>Sorry, your search query did not return any results.</p>
    <% end_if %>
        <nav aria-label="Page navigation" class="mt-4">
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
    <% end_if %>
</div>
