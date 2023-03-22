<?php

namespace app\admin\validate;

use think\Validate;

class Goods extends Validate
{
    // 当前的验证规则
    protected $rule = [
        'goods_name|商品名称' => 'require|min:2|max:70',
        'type_id|商品分类' => 'require',
        'sell_price|商品售价' => 'require|gt:0',
        'js_price|商品结算价' => 'require|gt:0',
        'number|商品库存' => 'require',
        'stock|库存' => 'require',
        'money|售价' => 'require',
    ];

    protected $message = [
        'goods_name.require' => '商品名称必须',
        'goods_name.min' => '商品名至少2个字符',
        'goods_name.max' => '商品名至多20个字符',
    ];

    // 验证场景
    protected $scene = [
        'add' => ['goods_name','sell_price','number']
    ];
}