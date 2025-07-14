<?php

use Embed\Adapters\Archive\Detectors\Title;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FormAction;
use silverstripe\Forms\Form;
use silverstripe\forms\DropdownField;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\PaginatedList;
use SilverStripe\View\ArrayData;

class VideosearchPageController extends PageController
{
      private static $allowed_actions = [
            'VideoSearchForm'
      ];
      public function index(HTTPRequest $request)
      {
            $videos = VideoObject::get();
            $activeFilters = ArrayList::create();

            if ($search = $request->getVar('Keywords')) {
                  $activeFilters->push(ArrayData::create([
                        'Label' => "'$search'"
                  ]));
                  $videos = $videos->filter([
                        'Title:PartialMatch' => $search
                  ]);
            }
            if ($search = $request->getVar('Category')) {
                  $activeFilters->push(ArrayData::create([
                        'Category' => VideoCategory::get()->filter(['ID' => $search])->first()->Title
                  ]));
                  $videos = $videos->filter([
                        'VideoCategories.ID' => $search
                  ]);
            }
            $paginatedVideo = PaginatedList::create(
                  $videos,
                  $request,
            )->setPageLength(5)->setPaginationGetVar('s');
            $data = [
                  'Results' => $paginatedVideo,
                  'ActivateFilters' => $activeFilters,
            ];
            return $data;
      }
      public function VideoSearchForm()
      {
            $form = Form::create(
                  $this,
                  'VideoSearchForm',
                  FieldList::create(
                        textfield::create('Keywords')
                              ->setAttribute('placeholder', 'search for a video'),
                        DropdownField::create('Category', 'Category', VideoCategory::get()->map('ID', 'Title'))
                              ->setEmptyString('Search in category')
                  ),
                  FieldList::create(FormAction::create('doVideoSearch', 'Search'))
            );
            $form->setFormMethod('GET')
                  ->setFormAction($this->Link())
                  ->disableSecurityToken()
                  ->loadDataFrom($this->request->getVars());
            return $form;
      }
}