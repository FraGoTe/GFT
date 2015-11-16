<?php

namespace Application\Model;

class UserRank
{
    public $id;
    public $username;
    public $rank;

    public function exchangeArray($data)
    {
        $this->id = (!empty($data['id'])) ? $data['id'] : null;
        $this->username = (!empty($data['username'])) ? $data['username'] : null;
        $this->rank = (!empty($data['rank'])) ? $data['rank'] : null;
    }
}