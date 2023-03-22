<?php


namespace app\common\model;


use app\common\traites\TraitModel;
use think\Model;

class PayCash extends Model
{

    public $name = 'common_pay_cash';
    use TraitModel;
    public $status = [
        0 => '申请中', 1 => '已付款', 2 => '拒绝付款',
    ];

    public function setStatus($post)
    {
        $id = $post['id'];
        if ($id < 1) return false;
        if ($post['status'] == 1) return $this->update(['id' => $id, 'admin_uid'=>session('admin_user.id'),'status' => 1]);
        if ($post['status'] == 2) return $this->update(['id' => $id,'admin_uid'=>session('admin_user.id'), 'status' => 2,'msg'=>$post['msg']]);
        return false;
    }
    public static function page_list($where,$limit, $page)
    {
        $map=self::whereMap();
        return self::alias('a')
            ->where($where)
            ->where($map)
            ->join('common_user b', 'a.u_id = b.id', 'left')
            ->join('common_admin c', 'a.admin_uid = c.id', 'left')
            ->join('common_admin d', 'a.market_uid = d.id', 'left')
            ->field('a.*,b.user_name,c.user_name admin_name,d.user_name as market_name')
            ->order('id desc')
            ->paginate(['list_rows' => $limit, 'page' => $page], false)->each(function($item, $key){
               $status='';
                switch ($item['status']){
                    case 0:$status = '申请中';break;
                    case 1:$status = '提现成功';break;
                    case 2:$status = '拒绝提现';break;
                }
                $item->text =$status;
            });
    }
}