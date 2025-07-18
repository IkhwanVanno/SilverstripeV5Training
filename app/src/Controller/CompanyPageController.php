<?php

use SilverStripe\Dev\Debug;
use SilverStripe\Control\Email\Email;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\SiteConfig\SiteConfig;

class CompanyPageController extends PageController
{

      /**
       * Defines methods that can be called directly
       * @var array
       */
      private static $allowed_actions = [
            'emailReceive' => true
      ];

      public function emailReceive(HTTPRequest $request)
      {
            $name = htmlspecialchars($request->postVar('name') ?? '');
            $email = filter_var($request->postVar('email'), FILTER_SANITIZE_EMAIL);
            $message = htmlspecialchars($request->postVar('message') ?? '');

            $siteConfig = SiteConfig::current_site_config();
            $to = $siteConfig->ContactEmail;

            $subject = "Pesan Kontak dari: {$name}";
            $body = "
                        <html>
                        <body>
                              <h2>Pesan Kontak</h2>
                              <p><strong>Nama:</strong> {$name}</p>
                              <p><strong>Email:</strong> {$email}</p>
                              <p><strong>Pesan:</strong><br>" . nl2br($message) . "</p>
                        </body>
                        </html>
                  ";
            $emailObj = Email::create()
                  ->setTo($to)
                  ->setFrom($email)
                  ->setSubject($subject)
                  ->setBody($body);

            $emailSent = $emailObj->send();
            $messageText = $emailSent
                  ? 'Pesan berhasil dikirim!'
                  : 'Gagal mengirim pesan!';

            $this->getRequest()->getSession()->set('FormMessage', $messageText);

            return $this->redirectBack();
      }
      protected function init()
      {
            parent::init();

            $this->customise([
                  'SiteConfig' => SiteConfig::current_site_config(),
            ]);
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