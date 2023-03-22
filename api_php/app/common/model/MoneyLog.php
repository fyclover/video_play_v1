<?php


namespace app\common\model;


use app\common\traites\TraitModel;
use think\Model;

class MoneyLog extends Model
{
    public $name = 'common_pay_money_log';
    use TraitModel;
    public function user()
    {
        return $this->hasOne(UserModel::class, 'id', 'uid');
    }

    public function getTypeAttr($value)
    {
        $type = [1 => '收入', 2 => '支出', 3 => '后台修改金额', 4 => '提现退款'];
        return isset($type[$value]) ? $type[$value] : $value;
    }

    public function getStatusAttr($value)
    {
        $type = [101 => '充值', 201 => '提现',301=>'积分操作',401=>'套餐分销奖励',403=>'充值分销奖励',];
        return isset($type[$value]) ? $type[$value] : $value;
    }

    public static function page_list($where,$limit,$page,$order)
    {
        $map=self::whereMap();
        return self::alias('a')
            ->where($where)
            ->where($map)
            ->join('common_user b', 'a.uid = b.id','left')
            ->join('common_admin c', 'a.market_uid = c.id','left')
            ->field('a.*,b.user_name,c.user_name admin_name')
            ->order($order)
            ->paginate(['list_rows'=>$limit,'page'=>$page], false);
    }
}