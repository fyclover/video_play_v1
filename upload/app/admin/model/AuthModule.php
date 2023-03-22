<?php
namespace app\admin\model;

use think\Model;
use think\facade\Request;
use think\facade\Db;
class AuthModule extends Model
{
    protected $autoWriteTimestamp = true;

    public function insertDb()
    {
        $data = Request::param();
        Db::startTrans();
        try {
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
        $result = $this->where('id', '=', $req['id'])->delete();
        return $result > 0 ? true : false;
    }
}