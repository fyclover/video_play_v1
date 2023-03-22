<?php
namespace app\admin\model;

use think\Model;
use think\facade\Request;
use think\facade\Db;
class AuthGroup extends Model{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;

    /**
     * 新增
     */
    public function insertDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
            if(!empty($data['rules']))
                $data['rules'] = implode(',',$data['rules']);
            $res = $this::create($data);
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
            if(!empty($data['rules']))
                $data['rules'] = implode(',',$data['rules']);
            $res = $this->update($data);
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
        Db::startTrans();
        try {
            if(in_array($req['id'],['1'])){
                return show(400,'内置角色不能删除');
            }
            $result = $this->where('id', 'eq', $req['id'])->delete();
            Db::commit();
            return true;
        } catch (\Exception $e) {
            Db::rollback();
            return false;
        }
    }
}