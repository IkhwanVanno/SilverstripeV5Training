<?php

use SilverStripe\Admin\ModelAdmin;

class CategoriesAdmin extends ModelAdmin
{
      private static $new_title = 'Categories';
      private static $url_segment = 'Categories';
      private static $managed_models = [
            VideoCategory::class
      ];


}