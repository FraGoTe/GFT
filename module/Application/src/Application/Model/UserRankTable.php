<?php

namespace Application\Model;

 use Zend\Db\TableGateway\TableGateway;

 class UserRankTable
 {
     protected $tableGateway;

     public function __construct(TableGateway $tableGateway)
     {
         $this->tableGateway = $tableGateway;
     }

     public function fetchAll()
     {
         $resultSet = $this->tableGateway->select();
         return $resultSet;
     }

     
     public function getUser($username)
     {
         $rowset = $this->tableGateway->select(array('username' => $username));
         
         return $rowset;
     }
     
     public function getRank($username)
     {
         $rowset = $this->tableGateway->select(array('username' => $username));
         $row = $rowset->current();
        
         if (!$row) {
            $rank = '';
         } else {
             $rank = $row->rank;
         }
         return $rank;
     }

     public function saveRank(UserRank $userRank)
     {
         $data = array(
             'username' => $userRank->username,
             'rank'  => $userRank->rank,
         );
         
         $exists = $this->getUser($userRank->username)->current();
         if (!$exists) {
             $this->tableGateway->insert($data);
         } else {
            $this->tableGateway->update($data, array('username' => $userRank->username));
         }
     }
 }