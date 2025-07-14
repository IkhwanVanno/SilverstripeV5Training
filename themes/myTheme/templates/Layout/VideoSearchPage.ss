<div class="video-search-page container">
    <div class="search-from">
        $VideoSearchForm
    </div>

    <div class="search-results mt-4">
        <% include VideoSearchResults %>

        <% include Pagination PaginatedList=$Results %>
    </div>
</div>
