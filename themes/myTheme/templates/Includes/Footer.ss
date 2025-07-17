<footer class="bg-dark text-light pt-5 pb-3">
  <div class="container">
    <div class="row">
      <!-- Kolom 1: Tentang -->
      <div class="col-md-4 mb-4">
        <h5>Tentang Kami</h5>
        <p>
          Kami adalah tim profesional yang berkomitmen memberikan solusi
          digital terbaik bagi bisnis Anda.
        </p>
      </div>

      <!-- Kolom 2: Navigasi (Dynamic dari SilverStripe) -->
      <div class="col-md-4 mb-4">
        <h5>Menu</h5>
        <ul class="list-unstyled">
      	<% include Navigation %>
        </ul>
      </div>

      <!-- Kolom 3: Kontak -->
      <div class="col-md-4 mb-4">
        <h5>Kontak</h5>
        <p><i class="bi bi-envelope"></i> info@perusahaan.com</p>
        <p><i class="bi bi-phone"></i> +62 812 3456 7890</p>
        <p><i class="bi bi-geo-alt"></i> Surabaya, Indonesia</p>
      </div>
    </div>

    <hr class="border-light" />
    <p class="text-center mb-0">
    <span href="$BaseHref" class="brand" rel="home">$SiteConfig.Title </span>All rights reserved.
    </p>
  </div>
</footer>
