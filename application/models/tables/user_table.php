<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_table{

    var $group_id = 0;
    var $username = '';
    var $email = '';
    var $nickname = '';
    var $password = '';
    var $state = 1;
    var $avatar = '/images/no_avatar.jpg';
    var $id = '';
    var $create_time = '';
    protected $_ci = '';


    function User_table(){
        $this->password = md5($this->password);
        $this->create_time = date('Y-m-d H:i:s');
        $this->_ci  =& get_instance();
    }

    function index(){

    }

    function set($var,$value){
        $this->$var = $value;
    }

    function _sha_password(){
        
    }

    function _check_password(){
        
    }
}

/* End of file user.php */
/* Location: ./application/models/user.php */