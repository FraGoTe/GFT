<?php

/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Http\Request;
use Zend\Http\Client;
use Zend\View\Model\JsonModel;

use Application\Model\UserRank;

class IndexController extends AbstractActionController
{

    public function indexAction()
    {

        return new ViewModel();
    }

    public function listAction()
    {
        $usersUrl = 'https://api.github.com/users?per_page=50&access_token=357a8f8fc14613a5a35958972025774ad6b01c48';

        $sl = $this->getServiceLocator();
        $objUserRank = $sl->get('UserRankTable');

        $userDetails = array();

        $cache = \Zend\Cache\StorageFactory::factory(array(
                    'adapter' => array(
                        'name' => 'filesystem',
                    ),
                    'plugins' => array(
                        'exception_handler' => array(
                            'throw_exceptions' => false
                        ),
                        'Serializer'
                    )
        ));

        $request = new Request();
        $requestUser = new Request();
        $client = new Client();
        $clientUser = new Client();

        $usersKey = date('Ymd') . '_users';
        if ($cache->hasItem($usersKey)) {
            $users = $cache->getItem($usersKey);
        } else {
            $request->setUri($usersUrl);
            $request->setMethod('GET');
            $requestUser->setMethod('GET');

            $response = $client->dispatch($request);
            $users = json_decode($response->getBody(), true);
            $cache->setItem($usersKey, $users);
        }

        foreach ($users as $user) {
            $username = $user['login'];
            $userKey = date('Ymd') . '_user_' . $username;

            if ($cache->hasItem($userKey)) {
                $userDet = $cache->getItem($userKey);
            } else {
                $userDetailUrl = 'https://api.github.com/users/' . $username . '?access_token=357a8f8fc14613a5a35958972025774ad6b01c48';
                $requestUser->setUri($userDetailUrl);
                $response = $clientUser->dispatch($requestUser);
                $userDet = json_decode($response->getBody(), true);

                $cache->setItem($userKey, $userDet);
            }

            $userDetails[] = array(
                'username' => $username,
                'name' => $userDet['name'],
                'email' => $userDet['email'],
                'rank' => $objUserRank->getRank($username)
            );
        }

        return new ViewModel(array('userList' => json_encode($userDetails)));
    }

    public function saveAction()
    {
        $sl = $this->getServiceLocator();
        $objUserRank = $sl->get('UserRankTable');
        $objUserR = new UserRank();
               
        $dataFromQuery = $this->params()->fromQuery();
        $users = json_decode($dataFromQuery['data'], true);
        
        foreach($users as $user) {
            $objUserR->exchangeArray($user);
            $objUserRank->saveRank($objUserR);
        }
        
        return new JsonModel(array(
            'success'=>true,
        ));
    }

    public function detailsAction()
    {
        return new ViewModel();
    }

}
