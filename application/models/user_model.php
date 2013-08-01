<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model {

    public $_uid = 0;
    public $_username = '';
    public $_email = '';
    public $_password = '';
    public $_table = '';
    public $_meta_table = '';
    public $_result = '';
    public $_return = '';
    protected $normal_key = array('username','password','email','nickname','state','group_id','avatar');
    protected $meta_key = array('first_name','last_name','url','gender','birthday','user_setting');
    public $_data = '';
    protected $_err = '';
    protected $_user = array();
    protected $_user_meta = array();

    public function __construct()
    {
        parent::__construct();
        $this->_table = $this->db->dbprefix("users");
        $this->_meta_table = $this->db->dbprefix("user_meta");
        $this->_err = array('state'=>FALSE);
    }

    function init($data){
        foreach($this->normal_key as $key){
            if(array_key_exists($key, $data)){
                $this->_user[$key] = $data[$key];
            }
        }
        foreach ($this->meta_key as $key) {
            if(array_key_exists($key, $data)){
                $this->_user_meta[$key] = $data[$key];
            }
        }
        $this->_return = $this->_user;
    }

    function login($data){

    }

    function get_user_by_id($uid = 0,$return_var = NULL){
        if($uid == 0){
            return false;
        }else{
            //if($return_var){
            //    $this->db->select();
            //}
            /*$this->db->select('a.*,m.*');
            $this->db->from($this->_table);
            $this->db->join($this->_meta_table,$this->_table'.id='.$this->_meta_table.'.user_id');
            $this->db->where($this->_table.'.id',$uid);
            $this->db->where(array(
                    $this->_table.'.meta_key'=>'first_name',
                    $this->_table.'.meta_key'=>'last_name',
                    $this->_table.'.meta_key'=>'description',
                    $this->_table.'.meta_key'=>'contact',
                    $this->_table.'.meta_key'=>'only_level',
                    ));*/
            $this->db->select(
                $this->_table.'.id as uid,'
                .$this->_table.'.username,'
                .$this->_table.'.nickname,'
                .$this->_table.'.email,'
                .$this->_table.'.group_id as gid,'
                .$this->_table.'.avatar,'
                .$this->_meta_table.'.meta_key,'
                .$this->_meta_table.'.meta_value')
            ->from($this->_table)
            ->join($this->_meta_table,$this->_table.'.id='.$this->_meta_table.'.user_id','left')
            ->where($this->_table.'.id',$uid)
            ->where_in($this->_meta_table.'.meta_key',array('first_name','last_name','description','level','url','user_setting','contact'));
            $this->_result = $this->db->get();
            return $this->db->last_query();
            $this->_format_return_data();
            return $this->_return;
        }
    }

    function get_user_by_username($username = NULL){
        if($username){
            $this->db->seelct('*');
            $this->db->from($this->_table);
            $this->db->join($this->_meta_table,$this->_table.'.id='.$this->_meta_table.'.user_id','left');
            $this->db->where($this->_table.'.username',$username);
            $this->db->where($this->_meta_table.'.meta_key','first_name');
            $this->_result = $this->db->query();
            $this->_format_return_data();
            return $this->_return;
        }else{
            return false;
        }
    }

    function get_user_by_email($email = NULL){
        if($email){
            $this->db->seelct('a.*,m.*');
            $this->db->from($this->_table);
            $this->db->join($this->_meta_table,$this->_table.'.id='.$this->_meta_table.'.user_id','left');
            $this->db->where($this->_table.'.email',$email);
            $this->_result = $this->db->query();
            $this->_format_return_data();
            return $this->_return;
        }else{
            return false;
        }
    }

    function create_user($data){
        // $this->load->model('tables/user_table','Tuser');
        //$this->db->set('group_id',2);
        // $this->Tuser->set('group_id',3);;
        // $this->db->insert($this->_table,$this->Tuser);
        // return $this->db->insert_id();

        if(!is_array($data) || empty($data)){
            $this->_err = '请填写完整信息!';
            return FALSE;
        }
        $this->_username = $data['username'];
        $this->_password = $data['password'];
        $this->_sha_pwd();
        $this->_email = $data['email'];
        $this->_nickname = $data['nickname'];
        //$this->_group_id = $data['gid'];
        $user = array(
                    'username'=>$this->_username,
                    'password'=>$this->_password,
                    'email'=>$this->_email,
                    'nickname'=>$this->_nickname,
                    // 'group_id'=>$this->_group_id,
                    'create_time'=>date('Y-m-d H:i:s'),
                    'salt'=>$this->_salt,
                );
        if($this->_check_valid()){
            $this->db->insert($this->_table,$user);
            $this->_return = $this->db->insert_id();
            return TRUE;
        }else{
            $this->_err['state'] = TRUE;
            array_push($this->_err,$user);
            return FALSE;
        }
    }

    function update_user(){
        
    }

    function delete_user(){
        
    }

    function get_err(){
        return $this->_err;
    }

    function get_response(){
        return $this->_return;
    }

    function _get_user_meta(){

    }

    function _sha_pwd(){
        $this->_salt = substr(uniqid(rand()), -6);
        $this->_password = md5(strtolower($this->_password).$this->_salt);
    }

    function _add_meta(){

    }

    function _format_return_data(){
        if($this->_result->num_rows() > 0){

            $this->_return = '';
        }else{
            $this->_err['state'] = TRUE;
            $this->_err = '';
            $this->_return = FALSE;
        }
    }

    function _create_data($data){
        $keys = array($data);
        $meta_key = array();
    } 

    function _check_valid(){
        if(empty($this->_username) || empty($this->_email)){
            // $this->_err = '用户名或者email未填写!';
            $this->_err['state'] = TRUE;
            array_push($this->_err, '用户名或者email未填写!');
            return FALSE;
        }
        $this->db->select('id');
        $this->db->from($this->_table);
        $this->db->or_where(array('username'=>$this->_username,'email'=>$this->_email));
        $query = $this->db->get();
        //$this->_err = array('query'=>$this->db->last_query(),'rows'=>$query->num_rows());
        if($query->num_rows() > 0){
            $this->_err['state'] = TRUE;
            array_push($this->_err, '用户名或者email有重复!');
        }else{
            // $this->_err = '用户名或者email有重复!';
            return TRUE;
        }
        return FALSE;
    }
}

/* End of file user.php */
/* Location: ./application/models/user.php */