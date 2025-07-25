<?php

namespace {

    use SilverStripe\SiteConfig\SiteConfig;
    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\View\Requirements;
    use SilverStripe\Dev\Debug;
    use SilverStripe\Control\HTTPRequest;
    use SilverStripe\Control\Email\Email;

    /**
     * @template T of Page
     * @extends ContentController<T>
     */
    class PageController extends ContentController
    {
        /**
         * An array of actions that can be accessed via a request. Each array element should be an action name, and the
         * permissions or conditions required to allow the user to access it.
         *
         * <code>
         * [
         *     'action', // anyone can access this action
         *     'action' => true, // same as above
         *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
         *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
         * ];
         * </code>
         *
         * @var array
         */
        private static $allowed_actions = [
            "test" => true,
            'emailReceive' => true,
        ];

        protected function init()
        {
            parent::init();
            Requirements::javascript('themes/myTheme/javascript/pagination.js', ['defer' => true]);

            $this->customise([
                'SiteConfig' => SiteConfig::current_site_config(),
            ]);
        }

        /**
         * Ambil SiteConfig untuk digunakan di template
         * @return SiteConfig
         */
        public function getSiteConfig()
        {
            return SiteConfig::current_site_config();
        }

        /**
         * Ambil favicon URL
         * @return string|null
         */
        public function getFaviconURL()
        {
            $config = SiteConfig::current_site_config();
            if ($config->FaviconImage() && $config->FaviconImage()->exists()) {
                return $config->FaviconImage()->URL;
            }
            return null;
        }

        /**
         * Cek apakah favicon tersedia
         * @return bool
         */
        public function hasFavicon()
        {
            $config = SiteConfig::current_site_config();
            return $config->FaviconImage() && $config->FaviconImage()->exists();
        }

         /**
       * Defines methods that can be called directly
       * @var array
       */

      public function emailReceive(HTTPRequest $request)
      {
            $name = $request->postVar('name');
            $email = $request->postVar('email');
            $message = $request->postVar('message');

            Email::create()
                  ->setTo(SiteConfig::current_site_config()->ContactEmail)
                  ->setFrom($email)
                  ->setSubject("Pesan Kontak dari: {$name}")
                  ->setHTMLTemplate('CustomEmail')
                  ->setData([
                        'Name' => $name,
                        'SenderEmail' => $email,
                        'MessageContent' => $message,
                  ])
                  ->send();

            return $this->redirectBack();
      }


      /**
       * Ambil data kontak untuk digunakan di template
       * @return SiteConfig
       */
      public function getContactInfo()
      {
            return SiteConfig::current_site_config();
      }

      /**
       * Cek apakah ada informasi kontak yang tersedia
       * @return bool
       */
      public function hasContactInfo()
      {
            $config = SiteConfig::current_site_config();
            return (
                  $config->ContactAddress ||
                  $config->ContactEmail ||
                  $config->ContactPhone ||
                  $config->ContactHours ||
                  $config->ContactInfo
            );
      }
    }
}
