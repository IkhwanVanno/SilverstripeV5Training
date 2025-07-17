<main class="py-5">
  <div class="container">
    <!-- Search Form -->
    <div class="row justify-content-center mb-4">
        <div class="card p-4 shadow-sm">
            $VideoSearchForm
        </div>
    </div>

    <!-- Search Results -->
    <div class="row">
      <div class="col-12">
        <% include VideoSearchResults %>
      </div>
    </div>

    <!-- Pagination -->
    <div class="row mt-4">
      <div class="col-12 d-flex justify-content-center">
        <% include Pagination PaginatedList=$Results %>
      </div>
    </div>
  </div>
</main>
