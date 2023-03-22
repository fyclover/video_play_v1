<?php
namespace app\admin\model;

use think\Model;
use think\facade\Db;
use think\facade\Request;
use app\admin\validate\AuthUser as ValidateAuthUser;
class AuthUser extends Model{
    
    protected $autoWriteTimestamp = true;

    public function group()
	{
        return $this->belongsTo(AuthGroup::class, 'group_id')->bind(['title']);
    }

    public function getLastLoginTimeAttr($value){
        return date('Y-m-d H:i',$value);
    }

    public function getAdminByUsernamePassword($username, $password)
    {
        $ressult = Db::name('AuthUser')->where([
            'account' => $username,
            'password' => $password
        ])->find();
        return $ressult ?: false;
    }

    public function insertDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $validate = new ValidateAuthUser;
            if (!$validate->scene('add')->check($data)) {
                return show(400, $validate->getError());
            }
            $data['password'] = md5($data['password']);
            $res = $this::create($data);
            if($res){
                $uid = $res->id;
                $result = AuthGroupAccess::create(['uid'=>$uid,'group_id'=>$data['group_id']]);
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
           Db::rollback();
            return false;
        }
    }

    /**
     * 编辑
     */
    public function updateDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            $validate = new ValidateAuthUser;
            if (!$validate->scene('edit')->check($data)) {
                return show(400, $validate->getError());
            }
            if(empty($data['password'])){
                $list = $this::find($data['id']);
                $data['password'] = $list['password'];
            }else{
                $data['password'] = md5($data['password']);
            }
            $res = $this::update($data);
            if($res){
                if(!empty($data['group_id'])){
                    $result = AuthGroupAccess::where('uid',$data['id'])->update(['group_id'=>$data['group_id']]);
                }
            }
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }

    /**
     * 删除
     * @return bool
     * @author TFC
     */
    public function deleteDb()
    {
        $req = Request::param();
        $result = $this->where('id', $req['id'])->delete();
        return $result > 0 ? true : false;
    }
}