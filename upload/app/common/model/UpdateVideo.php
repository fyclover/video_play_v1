<?php
namespace app\common\model;

use PhpOffice\PhpSpreadsheet\Reader\Xls\MD5;
use think\Model;
use think\facade\Request;
use think\facade\Db;
class UpdateVideo extends Model{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;
}