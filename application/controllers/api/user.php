<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH.'/libraries/REST_Controller.php';
class User extends REST_Controller {

    private $m = '';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }

    public function index_get()
    {
        // $response = $this->user_model->get_user_by_id(1);
        // $this->response($response,200);
        $data = array(
                'username'=>'a',
                'password'=>'b',
                'url'=>'aa',
            );
        $this->user_model->init($data);
        $this->response($this->user_model->get_response(),200);
    }

    function user_login_post(){
        $data = array(
                'username'=>$this->post('username', TRUE),
                'email'=>$this->post('email', TRUE),
                'password'=>$this->post('password', TRUE),
            );
        $data['login'] = TRUE;
        if(empty($data['username']) and empty($data['email'])){
            $this->response(NULL,400);
        }
        if(empty($data['password'])){
            $this->response(NULL,400);
        }
        $this->user_model->login();
        $err = $this->user_model->get_err();
        if($err['state'] === FLASE){
            $tmpuser = $this->user_model->get_response();
            if(md5(strtolower($data['password']).$tmpuser['salt']) == $tmpuser['password']){
                $array = array(
                        
                    );
                $this->session->set_userdata( $array );
            }
            //$this->response($this->user_model->get_response(),200);
        }else{
            $this->response($this->user_model->get_err(),404);
        }
    }

    function listusers_get(){
        $data = array(
                'limit'=>$this->get('limit',TRUE),
                'page'=>$this->get('page', TRUE)?$this->get('page', TRUE):1,
                'gid'=>$this->get('gid', TRUE)?$this->get('gid', TRUE):0,
                'state'=>$this->get('state', TRUE)?$this->get('state', TRUE):0,
            );
        $this->user_model->get_list($data);
        $err =$this->user_model->get_err();
        if($err['state'] === FALSE){

        }
    }

    function new_post(){
        $data = array(
                'username'=>$this->post('username', TRUE),
                'password'=>$this->post('password', TRUE),
                //'re_password'=>$this->
                'email'=>$this->post('email', TRUE),
                'nickname'=>$this->post('nickname', TRUE),
            );
        $this->user_model->create_user($data);
        $err = $this->user_model->get_err();
        if( $err['state'] === FALSE){
            $this->response($this->user_model->get_response(),200);
        }else{
            $this->response($this->user_model->get_err(),400);
        }
    }

    function del_user_post(){
        $data =  array(
                'username'=>$this->post('username',TRUE),
                'id'=>$this->post('id', TRUE),
            );
        //to-do
        //AuthACL
        $this->user_model->delete_user($data);
        $err = $this->user_model->get_err();
        if($err['state'] === FALSE){
            $this->response($this->user_model->get_response(),200);
        }else{
            $this->response($this->user_model->get_err(),400);
        }
    }

    function update_user_post(){
        $data = array(
                'id'=>$this->post('id', TRUE),
            );
        $this->user_model->update_user($data);
    }

    function del_users_post(){
        $data = array(
                'ids'=>$this->post('ids', TRUE),
            );
        //todo
        
        //ACL


    }

}

/* End of file  */
/* Location: ./application/controllers/api/user.php */